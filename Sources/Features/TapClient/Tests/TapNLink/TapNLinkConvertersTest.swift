//
//  TapNLinkConvertersTest.swift
//  TapClientUnitTests
//
//  Created by dev@iotize.com on 03/01/2019.
//

import Foundation
import XCTest
@testable import TapClient

import TapClientApi

class TapNLinkConvertersTest: XCTestCase {
	
	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testConverterLoginCredentials() throws {
		let converter = LoginCredentialHashedConverter()
		let password = "admin"
		let passwordHash = try Crypto.passwordHash(password: password)
		let bytes = converter.encode(mymodel: LoginCredentialHashed(username: "admin", password: passwordHash)).toBytes()
		
		XCTAssertEqual(bytes.ascii, "61646D696E00000000000000000000000155AFFC023AFF6882F56A4E0D9C5466".hexbytes.ascii)
	}
	
}
