//
//  RequestBuilder.swift
//  BLEProtocol_iOS
//
//  Created by dev@iotize.com on 28/12/2018.
//

import Foundation
import TapClientApi
import IotizeCore
import XCTest
@testable import TapClient

struct ConverterTests: Decodable {
	let tests: Array<ConverterTestOptions>
}

struct ConverterTestOptions: Decodable {
	let title: String?
	let decoded: DecodedOptions?
	let encoded: EncodedOptions?
	let converter: ConverterOptions?
}

struct ConverterOptions: Decodable {
	let name: String?
	let options: [String: String]
}

struct DecodedOptions: Decodable {
	let value: String?
	let format: String?
}

struct EncodedOptions: Decodable {
	let value: String?
	let format: String?
}

class ConverterTestLoader {
	
}


class GenericConverterTest: XCTestCase {
	
	var options: ConverterTests!
	
	override func setUp()  {
		// let path = Bundle.main.path(forResource: "test", ofType: "json")
		self.options = TestUtility.loadTestResource(path: "converter/encryption.json", ConverterTests.self)
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	public func testConverters() throws {
		for test in self.options.tests {
			print("Test " + (test.title ?? "UNAMED"))
			let converter = try self.getConverter(options: test.converter!)
			let input = test.decoded!.value!.hexbytes
			let expectedOutput = test.encoded?.value?.hexbytes
			let output = try converter.encode(bytes: input)
			XCTAssertEqual(output.hexstr, expectedOutput?.hexstr)
		}
	}
	
	public func getConverter(options: ConverterOptions) throws -> AesCBBC128Encryption{
		switch options.name {
		case "FrameEncryption":
			let key = options.options["key"]!.hexbytes
			let converter = try AesCBBC128Encryption(key: key)
			return converter
		default:
			throw IotizeError.runtimeError("Unkown converter with name " + options.name!)
		}
	}
	
}
