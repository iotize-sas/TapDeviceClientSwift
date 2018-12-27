//
//  ApplicationSourceUITest.swift
//  Starter
//
//  Created by Alexis Schultz on 22/12/2018.
//

import Foundation
import XCTest
@testable import IotizeCore

class Test: XCTestCase {

	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}

	func testHexString() {
		XCTAssert("AA BB CC DD".hexbytes.hexstr == "AABBCCDD")
	}


}
