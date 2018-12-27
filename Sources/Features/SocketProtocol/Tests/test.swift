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


class test: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSocketProtocol() {
		let url = URL(string: "tcp://localhost:2000")!
		let p = SocketProtocol(url: url)
		// TODO add blocking calls

		p.connect().toBlocking()
		p.write(data: "01 02 03 04".hexbytes).toBlocking()
		let message = p.read().toBlocking().single()
		
		XCTAssert(message.hexstr == "05060708")
    }


}
