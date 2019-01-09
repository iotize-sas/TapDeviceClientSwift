//
//  test.swift
//  CoreUITest
//
//  Created by Alexis Schultz on 22/12/2018.
//

import XCTest
import TapClientApi
import IotizeCore

@testable import SocketProtocol


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
	
	func testBlueSocketProtocol() throws {
		let url = URL(string: SERVER_URL)!
		print("Connecting to " + url.description )
		let p = BlueSocketProtocol(url: url)
		// TODO add blocking calls
		
		_ = try p.connect()
		try p.write(data: LWM2M_CMD)
		let message = try p.read()
		
		XCTAssert(message.hexstr == LWM2M_RESPONSE.hexstr)
		
		_ = try p.disconnect()
	}

}
