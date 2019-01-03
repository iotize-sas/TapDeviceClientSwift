//
//  TapNLinkTest.swift
//  Starter
//
//  Created by dev@iotize.com on 04/01/2019.
//

import Foundation
import XCTest
@testable import TapClient

import TapClientApi
import SocketProtocol

class TapNLinkTest: XCTestCase {
	var device: TapDevice!
	
	override func setUp() {
		let p = SyncProtocolAdapter(protocol: RxWebSocketProtocol(url: URL(string: "ws://192.168.20.120:2000")!))
		self.device = TapDevice.createFrom(protocol: p)
		try! self.device.connect()
	}
	
	override func tearDown() {
		do {
			try self.device.disconnect()
		}
		catch let error {
			print(error.localizedDescription)
		}
	}
	
	func testEncryption() throws {
		XCTAssertEqual(try self.device.service.device.getManufacturer().body(), "IOTIZE")
		
		try self.device.encryption(enabled: true)
		XCTAssertEqual(try self.device.service.device.getManufacturer().body(), "IOTIZE")
	
		try self.device.encryption(enabled: false)
		XCTAssertEqual(try self.device.service.device.getManufacturer().body(), "IOTIZE")
		let targetService = self.device.service.target
		

	}
	
	func testLogin() throws {
		try self.device.logout()

		let lockInfo = try self.device.service.interface.getLock().body()
		print("Lock info: " + lockInfo.description)
		XCTAssertEqual(try self.device.service.interface.getCurrentProfileId().body(), 0x0)

		try self.device.login(username: "admin", password: "admin")
		XCTAssertEqual(try self.device.service.interface.getCurrentProfileId().body(), 0xFFFF)
		XCTAssertEqual(try self.device.service.device.getManufacturer().body(), "IOTIZE")

		try self.device.logout()
		XCTAssertEqual(try self.device.service.interface.getCurrentProfileId().body(), 0x0)

	}
	
	
	func testSerialCommunication() throws {
//		try self.device.login(username: "admin", password: "admin")

		let uartSettings: UartSettings = try self.device.service.target.getUARTSettings().body()
		
		// Read all bytes
		var response = try self.device.service.target.readBytes().body()
		
		// Read output
		response = try self.device.service.target.readBytes(nbBytes: 10).body()
		
		
		// Send data
		let bytes: [UInt8] = [0x00, 0x01, 0x02]
		try self.device.service.target.send(data: bytes).successful()

		// Send data and wait for n bytes
		let response2 = try self.device.service.target.sendReceive(
			data: bytes
		).body()
		
		// Change config
		try self.device.service.target.setUARTSettings(value: uartSettings).successful()
	}
	
	
	func testVariables() throws {
		let varId: UInt8 = 4
		let variableAdress = try self.device.service.variable.getAddress(variableId: varId).body()
		XCTAssertEqual(variableAdress, 0x200000)
		let variableValue = try self.device.service.variable.getValue(variableId: varId).body()
	}
	
	func testReadWriteMemory() throws {
		let varId: UInt8 = 4
		let variableAdress = try self.device.service.target.readAddress(value: MemoryInfo(address: 0x200, wordCount: 10, wordSize: ._32_BITS)).body()
		
		
		try self.device.service.target.writeAddress(value:
			MemoryWriteInfo(
				address: MemoryInfo(address: 0x200, wordCount: 10, wordSize: ._32_BITS),
				value: "Hello World!".bytes
			)
		).body()
	}
	
	func commands(){
		var request = ApiRequest<Bytes>.GET(path: "/3//3")
		request = ApiRequest<Bytes>.POST(path: "/3//3")
		request = ApiRequest<Bytes>.PUT(path: "/3//3", body: "hello".bytes)
	}

}
