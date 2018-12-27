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
	
	public func getStreamSize() -> Int {
		return self.stream.size()
	}
	var bits_left = 0
	var bits: Int = 0
	
	public func readBitsInt(length: Int) -> Int {
		var bits_needed = length - self.bits_left
		if (bits_needed > 0){
			//  1 bit  => 1 byte
			//  8 bits => 1 byte
			//  9 bits => 2 bytes
			var bytes_needed = ((bits_needed - 1) / 8) + 1
			var buf = self.readBytes(length: bytes_needed)
			for byte in buf! {
				self.bits <<= 8
				self.bits |= Int(byte)
				self.bits_left += 8
			}
		}
		
		//  raw mask with required number of 1s, starting from lowest bit
		var mask = (1 << length) - 1
		//  shift mask to align with highest bits available in self.bits
		var shift_bits = self.bits_left - length
		mask <<= shift_bits
		//  derive reading result
		var res = (self.bits & mask) >> shift_bits
		//  clear top bits that we've just read => AND with 1s
		self.bits_left -= length
		mask = (1 << self.bits_left) - 1
		self.bits &= mask
		
		return res
	}
	
	public func readBool() -> Bool {
		return self.readBitsInt(length: 1) != 0
	}
	
	public func forwardBits(length: Int) {
		self.readBitsInt(length: length)
	}
}
