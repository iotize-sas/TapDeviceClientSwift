//
//  test.swift
//  CoreUITest
//
//  Created by Alexis Schultz on 22/12/2018.
//

import XCTest
import TapClientApi
import IotizeCore
import RxSwift
import RxBlocking
import SocketIO
import Starscream

@testable import SocketProtocol

class RelayServer{
	
	var url: URL
	
	init(url: String){
		self.url = URL(string: url)!
	}
	
//	init(url: URL){
//		self.url = url
//	}
	
//	func start(){
//		var server: TCPServer = TCPServer(addr: self.url.host!, port: self.url.port!)
//		var (success, msg) = server.listen()
//		var client = server.accept() //now you can use client socket api to read and write
//	}
}

//let SERVER_URL = "tcp://localhost:2000"
let SERVER_URL = "tcp://192.168.20.120:2000"
let WS_SERVER_URL = "ws://192.168.20.120:2000"

let LWM2M_CMD = "A2CA000007010403FFFF0002".hexbytes
let LWM2M_RESPONSE = "45039000".hexbytes

class test: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
	
	func testSocketProtocol() throws {
		let url = URL(string: SERVER_URL)!
		print("Connecting to " + url.description )
		let p = SocketProtocol(url: url)
		// TODO add blocking calls
		
		try p.connect().toBlocking().first()
		try p.write(data: LWM2M_CMD).toBlocking().first()
		let message = try p.read().toBlocking().first()
		
		XCTAssert(message!.hexstr == LWM2M_RESPONSE.hexstr)

		try p.disconnect().toBlocking().first()
	}
	
	
	func testBlueSocketProtocol() throws {
		let url = URL(string: SERVER_URL)!
		print("Connecting to " + url.description )
		let p = BlueSocketProtocol(url: url)
		// TODO add blocking calls
		
		try p.connect()
		try p.write(data: LWM2M_CMD)
		let message = try p.read()
		
		XCTAssert(message.hexstr == LWM2M_RESPONSE.hexstr)
		
		try p.disconnect()
	}
	
	func testWebsocketProtocol() throws {
		let url = URL(string: WS_SERVER_URL)!
		print("Connecting to " + url.description )
		let p = RxWebSocketProtocol(url: url)
		// TODO add blocking calls
		
		try p.connect().toBlocking().first()
		try p.write(data: "A2CA000007010003FFFF0002".hexbytes).toBlocking().first()
		let message = try p.read().toBlocking().first()
		
		XCTAssertEqual(message!.ascii, "EIoTSch00410000000D")
		
		try p.disconnect().toBlocking().first()
	}
	

}
