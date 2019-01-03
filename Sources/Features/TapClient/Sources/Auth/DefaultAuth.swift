//
//  DefaultAuth.swift
//  BLEProtocol_iOS
//
//  Created by dev@iotize.com on 28/12/2018.
//

import Foundation
import IotizeCore

extension String {
	func leftPadding(toLength: Int, withPad character: Character) -> String {
		let stringLength = self.count
		if stringLength < toLength {
			return String(repeatElement(character, count: toLength - stringLength)) + self
		} else {
			return String(self.suffix(toLength))
		}
	}
}

public class DefaultAuth: AuthApi {
	
	public var hashPassword: Bool
	public var interfaceApi: InterfaceAPI

	init(hashPassword: Bool, interfaceApi: InterfaceAPI){
		self.hashPassword = hashPassword
		self.interfaceApi = interfaceApi
	}
	
	public func login(credential: LoginCredential) throws {
		if (self.hashPassword){
			let passwordHash = try Crypto.passwordHash(password: credential.password ?? "")
			let hashedCredential = LoginCredentialHashed(username: credential.username, password: passwordHash)
			try self.interfaceApi.loginWithHash(credential: hashedCredential).successful()
		}
		else {
			try self.interfaceApi.login(credential: credential).successful()
		}
	}
	
	public func logout() throws {
		try self.interfaceApi.logout().successful()
	}
}
