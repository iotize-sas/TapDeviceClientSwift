//
//  test.swift
//  CoreUITest
//
//  Created by Alexis Schultz on 22/12/2018.
//

import XCTest
@testable import BLEProtocol_iOS

class test: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
		
		let scanner = BLEScanner()
		
		scanner.start()
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
