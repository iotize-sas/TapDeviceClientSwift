//
//  GenericModelConverterTest.swift
//  TapClient
//
//  Created by dev@iotize.com on 03/01/2019.
//

import XCTest
import Foundation
import TapClientApi
import IotizeCore

@testable import TapClient

struct ModelConverterTestOptionContainer: Decodable {
	let tests: Array<ModelConverterTestOption>
}

struct ModelConverterTestOption: Decodable {
	let title: String?
	let id: String
	let encoded: String
//	let decoded: JSonNode //[String: String]
}


class GenericModelConverterTest: XCTestCase {
	
	var options: ModelConverterTestOptionContainer!
	var converterProvider: ConverterProvider!
	
	override func setUp()  {
		// let path = Bundle.main.path(forResource: "test", ofType: "json")
		self.options = TestUtility.loadTestResource(path: "converter/models.json", ModelConverterTestOptionContainer.self)
		self.converterProvider = getDefaultTapAndLinkConverters()
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	public func testConverters() throws {
	
		for test in self.options.tests {
//			print("Test " + (test.title ?? "UNAMED"))
			
			let converter = try self.getConverter(options: test)
			let encoded = test.encoded.hexbytes
			let model: TapCodable = converter.decode(stream: TapStreamReader(withBytes: encoded))
			print(model.description)
//			let expectedOutput = test.decoded
			// TODO parse
//			let output = try converter.encode(bytes: input)
//			XCTAssertEqual(output.hexstr, expectedOutput?.hexstr)
		}
	}
	
	public func getConverter(options: ModelConverterTestOption) throws -> TapConverter {
		return self.converterProvider.getNoType(id: options.id)
	}
	
}
