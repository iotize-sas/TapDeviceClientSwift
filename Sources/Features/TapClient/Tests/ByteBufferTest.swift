//
//  test.swift
//  CoreUITest
//
//  Created by Alexis Schultz on 22/12/2018.
//

import XCTest
@testable import TapClient

import Core

class ByteBufferTest: XCTestCase {
	
	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testExample() throws {
		var p1: ComProtocol = MockProtocol()
		var client = TapClient(withProtocol: p1)
		
		
		let response = try client.GET(path: "/3//3")
		
		XCTAssert(response.successful())
		
		//		var tab2 = SocketProtocol()
		
		//		client.GET("/3//3")
		
		// XCTAssert(CoreClass().test() == 2)
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct results.
	}
	
	func testWriter() throws {
		print(toByteArray(1729.1729))
		print(toByteArray(1729.1729 as Float))
		print(toByteArray(UInt32(0x11223344).bigEndian))
		print(toByteArray(UInt8(0xFF).bigEndian))
		print(toByteArray(UInt16(0xAAFF).bigEndian))
	}
	func testPerformanceExample() {
		// This is an example of a performance test case.
		self.measure {
			// Put the code you want to measure the time of here.
		}
	}
	
}
