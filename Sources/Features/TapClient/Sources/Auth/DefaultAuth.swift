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
//		credential.username = credential.password.leftPadding(toLength: 16, withPad: " ")
//		credential.password = credential.password.leftPadding(toLength: 16, withPad: " ")

		if (self.hashPassword){
			credential.password = try Crypto.passwordHash(password: credential.password ?? "").ascii
		}
		try self.interfaceApi.login(credential: credential).successful()
	}
	
	public func logout() throws {
		try self.interfaceApi.logout().successful()
	}
}
