//
//  EncryptionAlgo.swift
//  TapClient
//
//  Created by dev@iotize.com on 09/01/2019.
//

import Foundation


public protocol EncryptionAlgo {
	
	func encode(bytes: Bytes) throws -> Bytes;
	
	func decode(bytes: Bytes) throws -> Bytes;
	
}


public class AesCBBC128Encryption: EncryptionAlgo {
	
	var aesEngine: AES
	
	public init(key: Bytes, iv: Bytes = [UInt8](repeating: 0, count: 16)) throws {
		if (key.count != 16){
			// TODO throw key must be 16 bytes for AES 128 bits
			throw IotizeError.runtimeError("Expected key to have a size of 16 bytes. Found " + String(key.count) + " bytes")
		}
		let blockMode = CBC(iv: iv)
		self.aesEngine = try AES(key: key, blockMode: blockMode, padding: CryptoSwift.Padding.zeroPadding)
	}
	
	public func encode(bytes: Bytes) throws -> Bytes {
		if bytes.count == 0 {
			return bytes
		}
		var encoded = try self.aesEngine.encrypt(bytes)
		if encoded.count > bytes.count {
			encoded = Array(encoded[0...bytes.count-1])
		}
		return encoded
	}
	
	public func decode(bytes: Bytes) throws -> Bytes {
		return try self.aesEngine.decrypt(bytes)
	}
}
