//
//  Crypto.swift
//  BLEProtocol_iOS
//
//  Created by dev@iotize.com on 02/01/2019.
//

import Foundation
import XCTest
@testable import TapClient
import IotizeCore
import TapClientApi


class CryptoTest : XCTestCase {
	
	public static var ADMIN_HASH = "0155AFFC023AFF6882F56A4E0D9C5466"
	
	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testHashPassword() throws {
		let hash = try Crypto.passwordHash(password: "admin")
		XCTAssertEqual(hash.hexstr, CryptoTest.ADMIN_HASH)
	}
}
