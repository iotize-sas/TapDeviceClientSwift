//
//  File.swift
//  BLEProtocol_iOS
//
//  Created by dev@iotize.com on 28/12/2018.
//

import Foundation

public enum AuthState {
	case LoggedIn
	case LoggedOut
}

public protocol AuthApi {
	
	func login(credential: LoginCredential) throws
	
	func logout() throws
}

public extension AuthApi {
//	var authState : AuthState = AuthState.LoggedOut
}
