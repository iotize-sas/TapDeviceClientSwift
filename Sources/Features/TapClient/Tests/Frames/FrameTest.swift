//
//  FrameTests.swift
//  Core
//
//  Created by dev@iotize.com on 27/12/2018.
//

import Foundation
import XCTest
@testable import TapClient


class StreamTest: XCTestCase {
	
	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testReadApduFrame() throws {
		let stream = TapStreamReader(withBytes: "A2 CA 00 00 07 01 04 00 FF FF 00 09".hexbytes)
		let apduRequest = stream.readApduRequest()
		let tapRequest = TapStreamReader(withBytes: apduRequest.data).readTapRequest()
		print(apduRequest)
		print(tapRequest)
	}
	
}
