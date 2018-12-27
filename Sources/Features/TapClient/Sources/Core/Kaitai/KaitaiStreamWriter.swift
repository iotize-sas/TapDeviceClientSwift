//
//  KaitaiStreamWriter.swift
//  Core
//
//  Created by Stephane on 26/12/2018.
//

import Foundation


public class KaitaiStreamWriter: KaitaiStream{
	
	public func toBytes() -> [UInt8] {
		return [ 1] // TODO
	}
	
	public func writeU1(_ v: UInt8) -> KaitaiStreamWriter {
		self.writeNumber(v)
		return self
	}
	
	public func writeU2(_ v: UInt16) -> KaitaiStreamWriter {
		self.writeNumber(v)
		return self
	}
	
	public func writeU4(_ v: UInt32) -> KaitaiStreamWriter {
		self.writeNumber(v)
		return self
	}
	
	
	public func writeS1(_ v: UInt8) -> KaitaiStreamWriter {
		self.writeNumber(v)
		return self
	}
	
	public func writeS2(_ v: Int16) -> KaitaiStreamWriter {
		self.writeNumber(v)
		return self
	}
	
	public func writeS4(_ v: Int32) -> KaitaiStreamWriter {
		self.writeNumber(v)
		return self
	}
	
	public func writeNumber(_ v: Any, _ length: Int = 4){
		// TODO
	}
	
	
	public func writeBytes(bytes: [UInt8]) -> KaitaiStreamWriter {
		// TODO
		return self
	}
}
