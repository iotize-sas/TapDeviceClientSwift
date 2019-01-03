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

//extension String {
//	public func uint8array() -> [UInt8] {
//		var retVal : [UInt8] = []
//		for thing in self {
//			print(thing)
//		}
//		return retVal
//	}
//}

extension Character {
	var isAscii: Bool {
		return unicodeScalars.first?.isASCII == true
	}
	var ascii: UInt32? {
		return isAscii ? unicodeScalars.first?.value : nil
	}
}

class CryptoTest : XCTestCase {
	
	public static var ADMIN_HASH = "0155AFFC023AFF6882F56A4E0D9C5466"
	public static var ADMIN_HASH_BYTES = CryptoTest.ADMIN_HASH.hexbytes

	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testHashPassword() throws {
		let password = "admin"
//		let exepectedPasswordHash = CryptoTest.ADMIN_HASH.hexbytes.ascii
		
		XCTAssertEqual(password.count, password.bytes.count)
		let hash = try Crypto.passwordHash(password: password)
//		let passwordHash = hash.ascii //String(bytes: hash, encoding: .ascii)!
//		let passwordChars = passwordHash.bytes
//		let password2 = hash.reduce("", { $0 + String(format: "%c", $1)})
//		print(passwordHash)
//		let passwordRebytes = hash.ascii.bytes
//		XCTAssertEqual(passwordChars.count, CryptoTest.ADMIN_HASH.hexbytes.count)
//		XCTAssertEqual(passwordHash.bytes.count, CryptoTest.ADMIN_HASH.hexbytes.count)
		XCTAssertEqual(hash.hexstr.count, CryptoTest.ADMIN_HASH.count)
		XCTAssertEqual(hash.hexstr, CryptoTest.ADMIN_HASH)
		
		XCTAssertEqual(hash.ascii, CryptoTest.ADMIN_HASH.hexbytes.ascii)
		XCTAssertEqual(hash.count, CryptoTest.ADMIN_HASH.hexbytes.count)
		XCTAssertEqual(hash.count, 16)
//		XCTAssertEqual(hash.ascii.bytes.ascii.bytes.count, 16)

		XCTAssertEqual(hash, CryptoTest.ADMIN_HASH.hexbytes)

	}
	
}
