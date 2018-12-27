//
//  KaitaiStreamReader.swift
//  Core
//
//  Created by Stephane on 26/12/2018.
//


public class KaitaiStreamReader: KaitaiStream{
	
	public func readU2() -> UInt16{
		return UInt16(self.readU2be()!)
	}
	
	public override func readU1() -> UInt8{
		return super.readU1()!
	}
	
	public func readU4() -> UInt32{
		return UInt32(self.readU4be()!)
	}
	
	public override func readS1() -> Int8{
		return super.readS1()!
	}
	
	public func readS2() -> Int16{
		return Int16(self.readS2be()!)
	}
	
	public func readS4() -> Int{
		return Int(self.readS4be()!)
	}
}
