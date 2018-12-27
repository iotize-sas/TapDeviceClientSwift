//
//  ScramAuth.swift
//  TapClientUnitTests
//
//  Created by dev@iotize.com on 29/12/2018.
//

import Foundation


import Foundation
import XCTest
import IotizeCore

@testable import TapClient


class ScramAuthTests: XCTestCase {
	
	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testComputeKeys() throws {
		let scramAuthTests: ScramAuthResourceTests = TestUtility.loadTestResource(path: "scram-auth.json", ScramAuthResourceTests.self)
		XCTAssertTrue(scramAuthTests.tests.count >= 1)
		for test in scramAuthTests.tests {
			let keys = try ScramAuth.computeKeys(credentials: test.input.credential, loginBody: test.input.serverResponse.model, clientNonce: UInt32(test.input.clientNonce))
			XCTAssertEqual(keys.hashedPassword.hexstr, test.output.hashedPassword)
			XCTAssertEqual(keys.clientProof.hexstr, test.output.clientProof)
			XCTAssertEqual(keys.serverKey, test.output.serverKey.hexbytes)
			XCTAssertEqual(keys.serverProof, test.output.serverProof.hexbytes)
			XCTAssertEqual(keys.saltedPassword, test.output.saltedPassword.hexbytes)
			XCTAssertEqual(keys.storedKey, test.output.storedKey.hexbytes)
		}
	}
	
}




struct ScramAuthResourceTests: Codable {
	let tests: [Test]
}

struct Test: Codable {
	let title: String
	let input: Input
	let output: Output
}

struct Input: Codable {
	let credential: LoginCredential
	let clientNonce: Int
	let serverResponse: ServerResponse
}

struct ServerResponse : Codable {
	let servernonce: UInt32
	let iterationNumber: UInt32
	let salt : String
	
	var model: ScramLoginResponseBody {
		return ScramLoginResponseBody(servernonce: self.servernonce, salt: self.salt.hexbytes, iterationNumber: self.iterationNumber)
	}
}

struct Output: Codable {
	let hashedPassword, saltedPassword, storedKey, serverKey: String
	let clientProof, serverProof, sessionKey: String
}
