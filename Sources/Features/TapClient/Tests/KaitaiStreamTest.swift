//
//  test.swift
//  CoreUITest
//
//  Created by Alexis Schultz on 22/12/2018.
//

import XCTest
import TapClientApi

@testable import TapClient


class KaitaiStreamTest: XCTestCase {
	
	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	
	func testWriteStream() throws {
		let buffer = KaitaiStreamWriter()
		
		buffer.write(UInt8(1))
		buffer.write(UInt16(2))
		buffer.write(UInt32(3))
		buffer.write(UInt64(4))
		buffer.write(UInt(5))
		buffer.write(Int8(1))
		buffer.write(Int16(2))
		buffer.write(Int32(3))
		buffer.write(Int64(4))
		buffer.write(Int(5))
		
		print(buffer.toBytes().hexstr)
	}
	
	
	func testWriteString() throws {
		let buffer = TapStreamWriter()
		buffer.writeStr("ABCDE", length: 5)
		buffer.writeStr("FGHIJ", length: 3)
		buffer.writeStr("KLMN", length: 7)
		buffer.writeStr("O")
		
//		XCTAssertEqual(buffer.toBytes().ascii, "ABCDEFGHKLMN   O")
		XCTAssertEqual(buffer.toBytes().count, 5 + 3 + 7 + 1)
//		XCTAssertEqual(buffer.toBytes().ascii, "ABCDEFGHKLMNO")
	}
	
	func testReadStream() throws {
		let buffer = KaitaiStreamReader(bytes: "0123456789ABCDEF".hexbytes)
		
		XCTAssert(buffer.readU2() == UInt16(0x0123))
		XCTAssert(buffer.readU1() == UInt8(0x45))
		XCTAssert(buffer.readBytes(length: 2) == "6789".hexbytes)
		XCTAssert(buffer.readBytesFull() == "ABCDEF".hexbytes)
	}
	
	func testReadBits() throws {
		var buffer = KaitaiStreamReader(bytes: "ABCD".hexbytes)
		
		XCTAssert(buffer.readBitsInt(length: 4) == UInt8(0xA))
		XCTAssert(buffer.readBitsInt(length: 4) == UInt8(0xB))
		XCTAssert(buffer.readBitsInt(length: 4) == UInt8(0xC))
		
		buffer = KaitaiStreamReader(bytes: "ABCD".hexbytes)
		XCTAssert(buffer.readBitsInt(length: 8) == UInt8(0xAB))
		
		buffer = KaitaiStreamReader(bytes: "ABCDEF".hexbytes)
		XCTAssert(buffer.readBitsInt(length: 20) == UInt32(0xABCDE))
	}
	
	
	func testReadIntegers() throws {
		var buffer = KaitaiStreamReader(bytes: "00000001ABCD".hexbytes)
		XCTAssertEqual(buffer.readU4(), UInt32(1))
		
		buffer = KaitaiStreamReader(bytes: "0001ABCD".hexbytes)
		XCTAssertEqual(buffer.readU2(), UInt16(1))
		
		buffer = KaitaiStreamReader(bytes: "01ABCD".hexbytes)
		XCTAssertEqual(buffer.readU1(), UInt8(1))
		
		buffer = KaitaiStreamReader(bytes: "00000001".hexbytes)
		XCTAssertEqual(buffer.readS4(), Int32(1))
	}
	
}
