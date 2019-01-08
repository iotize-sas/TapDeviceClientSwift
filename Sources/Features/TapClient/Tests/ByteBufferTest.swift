//
//  test.swift
//  CoreUITest
//
//  Created by Alexis Schultz on 22/12/2018.
//

import XCTest
@testable import TapClient


class ByteBufferTest: XCTestCase {
	
	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testWriteBytes() throws {
		let buffer = ByteBuffer(size: 100)
		
		_ = buffer
			.put([0xAA, 0xBB, 0xCC])
			.put([0xDD, 0xEE, 0xFF])
		
		XCTAssertEqual("AABBCCDDEEFF", buffer.bytes().hexstr)
		
	}
	
}
