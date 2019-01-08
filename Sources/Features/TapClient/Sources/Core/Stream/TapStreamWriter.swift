
extension RangeReplaceableCollection {
	public mutating func resize(_ size: IndexDistance, fillWith value: Iterator.Element) {
		let c = count
		if c < size {
			append(contentsOf: repeatElement(value, count: c.distance(to: size)))
		} else if c > size {
			let newEnd = index(startIndex, offsetBy: size)
			removeSubrange(newEnd ..< endIndex)
		}
	}
}

public class TapStreamWriter: KaitaiStreamWriter {
	
	// TODO injection
	static var crcEngine: CRC32 = CRC32.MPEG2
	
	var bits_left = 0
	
	var bits: Int = 0
	
	public static func computePaddingSize(count: Int, modulo: Int) -> Int {
		return (modulo - (count - modulo)) % modulo
	}
	
	public func appendCRC(){
		let crcBytes: UInt32 = TapStreamWriter.crcEngine.calculate(self.toBytes())
		_ = self.writeU4(crcBytes)
	}
	
	public func writeStr(_ string: String, length: Int){
		var bytes = string.bytes
		if (bytes.count != length){
			bytes.resize(length, fillWith: 0)
		}
		_ = self.writeBytes(bytes)
	}
	
	public func writeStr(_ string: String){
		self.writeStr(string, length: string.count)
	}
	
	public func writeBitsInt(_ v: UInt8, _ n: Int){
		self.writeBitsInt(Int(v), n)
	}
	
	public func writeBitsInt(_ v: Bool, _ n: Int = 1){
		self.writeBitsInt(v ? 1 : 0, n)
	}
	
	public func writeBitsInt(_ v: Int, _ n: Int){
//		if (n > 8){
//			let shiftBits = n - 8
//			var byteToWrite: UInt8 = UInt8(v >> max(0, shiftBits)) & UInt8(0xFF)
//			self.writeBitsByte(byteToWrite, Int)
//			let remainingN = n - 8
//			self.writeBitsInt(remainingValue, remainingN)
//		}
//		else if (n > 0){
//			self.writeBitsByte(UInt8(v && 0xFF), n)
//			self.writeBitsInt(remainingValue, remainingN)
//		}
//		
		for i in (0..<n).reversed(){
			self.write_boolean((v >> i) & 0x1 == 0x1)
		}
	}
	
	public func write_boolean(_ value: Bool){
		self._flushBitsLeftIfNeeded()
		let bitMask = 1 << self.bits_left - 1
		if (value){
			self.bits |= bitMask
		}
		else {
			self.bits &= ~bitMask
		}
		self.bits_left -= 1
		self._flushBitsLeftIfNeeded()
	}
	
	
	public func forwardBits(_ n: UInt8){
		self.writeBitsInt(0, Int(n))
	}
	
	func _flushBits(){
		_ = self.writeU1(UInt8(self.bits))
		self.bits_left = 8
	}
	func _flushBitsLeftIfNeeded(){
		if (self.bits_left <= 0){
			self._flushBits()
		}
	}
}
