//
//  test.swift
//  CoreUITest
//
//  Created by Alexis Schultz on 22/12/2018.
//

import XCTest
@testable import TapClient

import TapClientApi

class test: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
		var p1: ComProtocol = MockProtocol { bytes in
			var r = ApduRequest.fromBytes(bytes: bytes)
			print("Received request: " + r.description)
			return [0x69, 0x90, 0x00]
		}
		
		
		var client = TapClient(withProtocol: p1)
		
		
		let response = try client.GET(path: "/3//3")
		
		print("Response: " + response.description)
		XCTAssert(response.successful())
		
//		var tab2 = SocketProtocol()
		
//		client.GET("/3//3")
		
		// XCTAssert(CoreClass().test() == 2)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
	
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
