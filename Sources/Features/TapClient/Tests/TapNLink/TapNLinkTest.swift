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
		let p1: ComProtocol = MockProtocol { bytes in
			let r = ApduRequest.fromBytes(bytes: bytes)
			let request = TapRequest.fromBytes(bytes: r.data)
			print("Received request: " + request.description)
			switch (request.description){
			case "GET /3/65535/2":
				return [TapResultCode.NO_ERROR] + self.EXPECTED_SN.bytes + [0x90, 0x00]
			default:
				return [TapResultCode.NOT_IMPLEMENTED] + [0x90, 0x00]
			}
		}
		
		let tap: TapDevice = TapDevice.createFrom(protocol: p1)
		try tap.connect()
		//tap.login(username: "admin", password: "admin")
		let period = try tap.service.bundle.getDatalogPeriod(bundleId: 1).body()
		//tap.service.interface.getLock().body
		print("PERIOD: " + String(period))
		
		
		let sn = try tap.service.device.getSerialNumber().body()
		print("SN: " + sn)
		XCTAssertEqual(sn, EXPECTED_SN)
	}
	
	func testEncryption() throws {
		let p1: ComProtocol = MockProtocol { bytes in
			let r = ApduRequest.fromBytes(bytes: bytes)
			let request = TapRequest.fromBytes(bytes: r.data)
			print("Received request: " + request.description)
			switch (request.description){
			case "GET /3/65535/2":
				return [TapResultCode.NO_ERROR] + self.EXPECTED_SN.bytes + [0x90, 0x00]
			case "GET /1024/65535/6":
				return [TapResultCode.NO_ERROR, 0x00, 0x08] + [0x90, 0x00]
			case "GET /1024/65535/47":
				return [TapResultCode.NO_ERROR, 0xAA, 0xBB, 0xCC, 0xDD, 0x90, 0x00]
			case "POST /1024/65535/0 0x61646D696E00000000000000000000000155AFFC023AFF6882F56A4E0D9C5466":
				return [TapResultCode.NO_ERROR, 0x90, 0x00]
			default:
				return [TapResultCode.NOT_IMPLEMENTED] + [0x90, 0x00]
			}
		}
		
		let tap: TapDevice = TapDevice.createFrom(protocol: p1)
		try tap.connect()
		
		try tap.login(username: "admin", password: "admin")
		
		let sn = try tap.service.device.getSerialNumber().body()
		XCTAssertEqual(sn, EXPECTED_SN)
		
		
	}
	
	
	func testGets() throws {
		let p1: ComProtocol = try MockProtocol.fromJSONSnapshot(path: TestUtility.snapshotPath("device-1-11.json"))
		let tap: TapDevice = TapDevice.createFrom(protocol: p1)
		try tap.connect()
		XCTAssertEqual(try tap.service.device.getSerialNumber().body(), "IoTize00410000009B")
		XCTAssertEqual(try tap.service.device.getModelName().body(), "TAP 1.10 L4 NFC BLE")
//		XCTAssertEqual(try tap.service.device.getMemoryFree().body(), 12)
		XCTAssertEqual(try tap.service.device.getFirmwareVersion().body(), "1.15 May 29 2018 17:07:18")
		XCTAssertEqual(try tap.service.device.getManufacturer().body(), "IOTIZE")
		// XCTAssertEqual(try tap.service.device.getAvailablePowerSource().body(), AvailablePowerSource.AC_EXTERNAL_POWER)
		XCTAssertEqual(try tap.service.target.getProtocol().body(), TargetProtocol.SWD)
		XCTAssertEqual(try tap.service.target.getFirmwareVersion().body(), "1.0 0")
		XCTAssertEqual(try tap.service.datalog.getOptions().body(), DatalogOption(security: false, qos: false, logOnChange: false, rollingMode: false, autorun: false))
//		XCTAssertEqual(try tap.service.target.getPageSize(), "1.0 0")
//		let uartSettings = UartSettings(
//			ctr2: UartSettings.Ctr2(slv: 0, ofs: true, baudrate: 100),
//			ctr1: UartSettings.Ctr1(physicalPort: UartSettings.PhysicalPort.USB, stopBit: UartSettings.StopBit.ONE_AND_HALF, parity: UartSettings.BitParity.NONE, dataLength: 10, handshakeDelimiter: UartSettings.HandshakeDelimiter.CR, handshakeValue: .RTS, timeout: 10)
//		)
//		XCTAssertEqual(try tap.service.target.getUARTSettings().body(), uartSettings)
		XCTAssertEqual(try tap.service.target.getMaxVoltage().body(), 3500)
		//		XCTAssertEqual(try tap.service.interface.getAvailableHostProtocols().body(), 2000)
		XCTAssertEqual(try tap.service.interface.getBleAddress().body(), "AF:4E:4E:C2:F4:FB")
		XCTAssertEqual(try tap.service.interface.getNetworkGatewayIp().body(), "0.0.0.0")
		XCTAssertEqual(try tap.service.interface.getNetworkInfraIpMask().body(), "255.255.255.0")

	}
	
	
}
