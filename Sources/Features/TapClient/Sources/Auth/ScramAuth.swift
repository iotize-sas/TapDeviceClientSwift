//
//  ScramAuth.swift
//  BLEProtocol_iOS
//
//  Created by dev@iotize.com on 28/12/2018.
//

import Foundation
import TapClientApi
import IotizeCore
import CryptoSwift

public enum ScramError: Error {
	case invalidServerKey(expected: Bytes, actual: Bytes)
}

public struct SessionData {
	var username: String
	var key: Bytes
}

func _body<T>(_ in: Any) -> T {
	return 1 as! T
}


public extension Array where Element == UInt8 {
	public func truncate(length: Int) -> Array<UInt8>{
		if (self.count > length){
			return Array(self[0...length-1])
		}
		else {
			return self
		}
	}
}

public protocol NonceGenerator {
	
	func next() -> UInt32
	
}

public class RandomNonceGenerator: NonceGenerator {
	
	public func next() -> UInt32 {
		return UInt32.random(in: UInt32.min ... UInt32.max)
	}
	
}


public class ScramAuth: AuthApi {
	
	static let SERVER_KEY_LABEL = "ServerKey"
	static let CLIENT_KEY_LABEL = "ClientKey"
	static let HASH_KEY_LENGTH = 16
	static let KEY_LENGTH = 16
	static let SERVER_KEY_ITERATION_NUMBER = 2
	static let CLIENT_KEY_ITERATION_NUMBER = 2

	struct Keys {
		var storedKey: Bytes
		var serverKey: Bytes
		var saltedPassword: Bytes
		var hashedPassword: Bytes
		var clientProof: Bytes
		var serverProof: Bytes
	}
	
	var scramService: ScramAPI
	var interfaceService: InterfaceAPI
	var sessionData: SessionData?
	
	var authState = AuthState.LoggedOut
	var username: String?
	var nonceGenerator: NonceGenerator
	
	init(scramService: ScramAPI, interfaceService: InterfaceAPI, nonceGenerator: NonceGenerator = RandomNonceGenerator()){
		self.scramService = scramService
		self.interfaceService = interfaceService
		self.nonceGenerator = nonceGenerator
	}
	
	public func getSessionData() -> SessionData?{
		return self.sessionData
	}
	
	public func login(credential: LoginCredential) throws {
		let clientNonce: UInt32 = self.nonceGenerator.next()
		let loginParams = ScramLoginParams(username: credential.username, clientNonce: clientNonce)
		let loginResponseBody: ScramLoginResponseBody = try self.scramService.login(params: loginParams).body()
		let keys = try ScramAuth.computeKeys(credentials: credential, loginBody: loginResponseBody, clientNonce: loginParams.clientNonce)
		let serverNonce: UInt32 = loginResponseBody.serverNonce;
		
		let deviceServerProof: Bytes = try self.scramService.loginProof(params: keys.clientProof).body()
		
		let expectedServerProof = keys.serverProof
		
		if (expectedServerProof != deviceServerProof){
			throw ScramError.invalidServerKey(expected: expectedServerProof, actual: deviceServerProof)
		}
		let sessionKey = try ScramAuth.computeSessionKey(clientNonce: clientNonce, serverNonce: serverNonce, userSalt: loginResponseBody.salt, serverKey: keys.serverKey, storedKey: keys.storedKey);
		
		self.sessionData = SessionData(username: credential.username, key: sessionKey)
		self.authState = AuthState.LoggedIn
		self.username = credential.username
	}
	
	public func logout() throws {
		try self.interfaceService.logout().successful()
		self.authState = AuthState.LoggedOut
		self.username = nil
		self.sessionData = nil
	}
	
	static func computeKeys(credentials: LoginCredential, loginBody: ScramLoginResponseBody, clientNonce: UInt32) throws -> Keys {
		let hashedPassword = try ScramAuth.hashPassword(password: credentials.password)
		// console.debug('ScramAuth', 'hashedPassword', FormatHelper.toHexString(hashedPassword));
		let saltedPassword = try ScramAuth.saltedPassword(hashedPassword: hashedPassword, userSalt: loginBody.salt, iterations: loginBody.iterationNumber)
		// console.debug('ScramAuth', 'saltedPassword', FormatHelper.toHexString(saltedPassword));
		// byte[] clientKey = ScramAuth.clientKey(saltedPassword);
		// console.debug('ScramAuth', 'clientKey', FormatHelper.toHexString(clientKey));
		let storedKey = try ScramAuth.storedKey(saltedPassword: saltedPassword)
		// console.debug('ScramAuth', 'storeKey', FormatHelper.toHexString(storedKey));
		let serverKey = try ScramAuth.serverKey(saltedPassword: saltedPassword)
		// console.debug('ScramAuth', 'serverKey', FormatHelper.toHexString(serverKey));
		
		let clientProof = try ScramAuth.clientProof(storedKey: storedKey, clientNonce: clientNonce, serverNonce: loginBody.serverNonce)
		// console.debug('ScramAuth', 'clientProof', FormatHelper.toHexString(clientProof));
		
		let serverProof = try ScramAuth.serverProof(serverKey: serverKey, clientNonce: clientNonce, serverNonce: loginBody.serverNonce)
		// console.debug('ScramAuth', 'serverProof', FormatHelper.toHexString(serverProof));
		return Keys(
			storedKey: storedKey,
			serverKey: serverKey,
			saltedPassword: saltedPassword,
			hashedPassword: hashedPassword,
			clientProof: clientProof,
			serverProof: serverProof
		)
	}
	
	
	static func clientProof(storedKey: Bytes, clientNonce: UInt32, serverNonce: UInt32) throws -> Bytes {
		return try self.computeProof(key: storedKey, nonce1: clientNonce, nonce2: serverNonce).truncate(length: ScramAuth.KEY_LENGTH)
	}
	
	// computeClientProof(byte[] storedKey, byte[] clientSignature): byte[] {
	//     return ScramAuth.XOR(storedKey, clientSignature);
	// }
	
	static func serverProof(serverKey: Bytes, clientNonce: UInt32, serverNonce: UInt32) throws -> Bytes {
		return try self.computeProof(key: serverKey, nonce1: serverNonce, nonce2: clientNonce).truncate(length: ScramAuth.KEY_LENGTH)
	}
	
	/**
	*
	* @param input
	*/
	static func HASH(input: Bytes, salt: Bytes, iterations: Int) throws -> Bytes {
		if (iterations < 0){
 			throw IotizeError.illegalArgument
		}
		if (iterations > 1000000000){
			print("Iteration number is very big \(iterations). It may take some time to compute hash key." )
		}
		return try PKCS5.PBKDF2(
			password: input,
			salt: salt,
			iterations: iterations,
			keyLength: ScramAuth.HASH_KEY_LENGTH,
			variant: .sha256
		).calculate()
	}
	
	/**
	*
	* @param input
	*/
	static func HMAC(input: Bytes, key: Bytes) throws -> Bytes {
		return try CryptoSwift.HMAC.init(key: key, variant: .sha256).authenticate(input)
	}
	
	static func hashPassword(password: String) throws -> Bytes {
		return try Crypto.passwordHash(password: password)
	}
	
	static func saltedPassword(hashedPassword: Bytes, userSalt: Bytes, iterations: UInt32) throws -> Bytes {
		return try ScramAuth.HASH(input: hashedPassword, salt: userSalt, iterations: Int(iterations))
	}
	
	/**
	* StoredKey = H ( ClientKey )
	* @param saltedPassword
	*/
	static func storedKey(saltedPassword: Bytes) throws -> Bytes {
		return try ScramAuth.HASH(
			input: saltedPassword,
			salt: ScramAuth.CLIENT_KEY_LABEL.bytes,
			iterations: ScramAuth.CLIENT_KEY_ITERATION_NUMBER
		)
	}
	
	static func serverKey(saltedPassword: Bytes) throws -> Bytes {
		return try ScramAuth.HASH(
			input: saltedPassword,
			salt: ScramAuth.SERVER_KEY_LABEL.bytes,
			iterations: ScramAuth.SERVER_KEY_ITERATION_NUMBER
		)
	}
	
	static func computeProof(key: Bytes, nonce1: UInt32, nonce2: UInt32) throws -> Bytes {
		let buffer = KaitaiStreamWriter()
		buffer.write(nonce1)
		buffer.write(key)
		buffer.write(nonce2)
		return try ScramAuth.HMAC(
			input: buffer.toBytes(),
			key: key
		)
	}
	
	static func computeSessionKey(clientNonce: UInt32, serverNonce: UInt32, userSalt: Bytes, serverKey: Bytes, storedKey: Bytes) throws -> Bytes {
		let buffer = KaitaiStreamWriter()
		buffer
			.writeU4(clientNonce)
			.writeBytes(serverKey)
			.writeBytes(userSalt)
			.writeBytes(storedKey)
			.writeU4(serverNonce)
		// .add(encodedLabel)
		
		let key = try ScramAuth.HMAC(input: buffer.toBytes(), key: serverKey)
		return key.truncate(length: ScramAuth.KEY_LENGTH)
	}
	
}
