//
//  CRCTest.swift
//  BLEProtocol_iOS
//
//  Created by dev@iotize.com on 04/01/2019.
//

import Foundation
import XCTest
import TapClientApi
@testable import TapClient


struct TestOptionContainer: Decodable {
	let tests: Array<TestOption>
}

struct TestOption: Decodable {
	let title: String?
	let crc: String
	let frame: String
}


class GenericCRCTest: XCTestCase {
	
	var options: TestOptionContainer!
	
	override func setUp()  {
		// let path = Bundle.main.path(forResource: "test", ofType: "json")
		self.options = TestUtility.loadTestResource(path: "converter/crc.json", TestOptionContainer.self)
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	public func testConverters() throws {
		XCTAssert(self.options.tests.count > 0)
		let crcEngine = CRC32.MPEG2
		
		for test in self.options.tests {
			let frame = test.frame.hexbytes
			let crc = crcEngine.calculate(frame)
			XCTAssertEqual(TapStreamWriter().writeU4(crc).toBytes(), test.crc.hexbytes)
		}
	}
	
}
