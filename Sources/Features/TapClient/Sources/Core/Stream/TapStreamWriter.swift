
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

	public func writeStr(_ string: String, length: Int){
		var bytes = string.bytes
		bytes.resize(length, fillWith: 0)
		self.writeBytes(bytes)
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
		fatalError("Not implemented")
	}
	
	public func forwardBits(_ v: UInt8){
		fatalError("Not implemented")
	}
}
