//
//  test.swift
//  CoreUITest
//
//  Created by Alexis Schultz on 22/12/2018.
//

import XCTest
@testable import TapClient

import TapClientApi

class TapNLinkTest: XCTestCase {
	var EXPECTED_SN = "IoTize00410000001"
	
	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testGetValues() throws {
		var p1: ComProtocol = MockProtocol { bytes in
			var r = ApduRequest.fromBytes(bytes: bytes)
			var request = TapRequest.fromBytes(bytes: r.data)
			print("Received request: " + request.description)
			switch (request.description){
			case "GET /3/65535/2":
				return [TapResultCode.IOTIZE_200_NO_ERROR] + self.EXPECTED_SN.bytes + [0x90, 0x00]
			default:
				return [TapResultCode.IOTIZE_501_NOT_IMPLEMENTED] + [0x90, 0x00]
			}
		}
		
		var tap: TapDevice = TapDevice.createFrom(protocol: p1)
		tap.connect()
		//tap.login(username: "admin", password: "admin")
		let period = try tap.service.bundle.getDatalogPeriod(bundleId: 1).body()
		//tap.service.interface.getLock().body
		print("PERIOD: " + String(period))
		
		
		let sn = try tap.service.device.getSerialNumber().body()
		print("SN: " + sn)
		XCTAssertEqual(sn, EXPECTED_SN)
	}
	
	func testEncryption() throws {
		var p1: ComProtocol = MockProtocol { bytes in
			var r = ApduRequest.fromBytes(bytes: bytes)
			var request = TapRequest.fromBytes(bytes: r.data)
			print("Received request: " + request.description)
			switch (request.description){
			case "GET /3/65535/2":
				return [TapResultCode.IOTIZE_200_NO_ERROR] + self.EXPECTED_SN.bytes + [0x90, 0x00]
			case "GET /1024/65535/6":
				return [TapResultCode.IOTIZE_200_NO_ERROR, 0x00, 0x08] + [0x90, 0x00]
			case "GET /1024/65535/47":
				return [TapResultCode.IOTIZE_200_NO_ERROR, 0xAA, 0xBB, 0xCC, 0xDD, 0x90, 0x00]
			case "POST /1024/65535/0 E0D56003997F0000":
				return [TapResultCode.IOTIZE_200_NO_ERROR, 0x90, 0x00]
			default:
				return [TapResultCode.IOTIZE_501_NOT_IMPLEMENTED] + [0x90, 0x00]
			}
		}
		
		var tap: TapDevice = TapDevice.createFrom(protocol: p1)
		tap.connect()
		
		try tap.login(username: "admin", password: "admin")
		
		let sn = try tap.service.device.getSerialNumber().body()
		XCTAssertEqual(sn, EXPECTED_SN)
			
		
	}
	
	
}
