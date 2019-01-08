//
//  KaitaiStreamWriter.swift
//  Core
//
//  Created by Stephane on 26/12/2018.
//

import Foundation
import TapClientApi

typealias Byte = UInt8

func toByteArray<T>(_ value: T) -> [UInt8] {
	var value = value
	return withUnsafePointer(to: &value) {
		$0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout<T>.size) {
			Array(UnsafeBufferPointer(start: $0, count: MemoryLayout<T>.size))
		}
	}
}

func fromByteArray<T>(_ value: [UInt8], _: T.Type) -> T {
	return value.withUnsafeBufferPointer {
		$0.baseAddress!.withMemoryRebound(to: T.self, capacity: 1) {
			$0.pointee
		}
	}
}


public class KaitaiStreamWriter : KaitaiWritableStream{
	var stream: ByteBuffer
	
	var position: Int
	
	var isEOF: Bool
	
	public func reverseBytes(){
		self.stream.reverse()
	}
	
	public init(bufferSize: Int = 255){
		self.stream = ByteBuffer(size: bufferSize) // TODO buffer size
		self.position = 0
		self.isEOF = false
	}
	
	public init(bytes: Bytes){
		self.stream = ByteBuffer(bytes: bytes) // TODO buffer size
		self.position = 0
		self.isEOF = false
	}
	
	func clear() -> KaitaiStreamWriter{
		self.stream = ByteBuffer(size: 255) // TODO CLEAN instead
		self.position = 0
		self.isEOF = false
		return self
	}
	
	func seek(position: Int) {
		return self.stream.setPosition(position)
	}
	
	func size() -> Int {
		return self.stream.position()
	}
	
	public func toBytes() -> [UInt8] {
		return self.stream.bytes()
	}
	
	public func writeU1(_ v: UInt8) -> KaitaiStreamWriter {
		self.write(v)
		return self
	}
	
	public func writeU2(_ v: UInt16) -> KaitaiStreamWriter {
		self.write(v)
		return self
	}
	
	public func writeU4(_ v: UInt32) -> KaitaiStreamWriter {
		self.write(v)
		return self
	}
	
	
	public func writeS1(_ v: UInt8) -> KaitaiStreamWriter {
		self.write(v)
		return self
	}
	
	public func writeS2(_ v: Int16) -> KaitaiStreamWriter {
		self.write(v)
		return self
	}
	
	public func writeS4(_ v: Int32) -> KaitaiStreamWriter {
		self.write(v)
		return self
	}

	
	public func writeBytes(_ bytes: [UInt8]) -> KaitaiStreamWriter {
		self.write(bytes)
		return self
	}
	
	public func write(_ bytes: [UInt8]) {
		_ = self.stream.put(bytes)
	}
	
	public func write(_ value: UInt16) {
		_ = self.stream.put(toByteArray(value.bigEndian))
	}
	
	public func write(_ value: UInt32) {
		_ = self.stream.put(toByteArray(value.bigEndian))
	}
	
	public func write(_ value: UInt64) {
		_ = self.stream.put(toByteArray(value.bigEndian))
	}
	
	public func write(_ value: UInt) {
		_ = self.stream.put(toByteArray(value.bigEndian))
	}
	
	public func write(_ value: Int16) {
		_ = self.stream.put(toByteArray(value.bigEndian))
	}
	
	public func write(_ value: Int32) {
		_ = self.stream.put(toByteArray(value.bigEndian))
	}
	
	public func write(_ value: Int64) {
		_ = self.stream.put(toByteArray(value.bigEndian))
	}
	
	public func write(_ value: Int) {
		_ = self.stream.put(toByteArray(value.bigEndian))
	}
	
	public func write(_ value: String) {
		_ = self.writeBytes(value.bytes)
	}
	
	public func write<T>(_ value: T) {
		_ = self.stream.put(toByteArray(value))
	}
}
