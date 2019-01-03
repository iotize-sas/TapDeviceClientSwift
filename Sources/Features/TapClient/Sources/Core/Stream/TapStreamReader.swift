import TapClientApi
import IotizeCore

public class TapStreamReader: KaitaiStreamReader{
	
	init(withBytes data: [UInt8]){
		super.init(bytes: data)
	}
	
	public func readStr(length: Int) -> String {
		return self.readStrByteLimit(length: length, encoding: String.Encoding.ascii)!
	}
	
	public func read(_ type: UInt32.Type) throws -> UInt32 {
		return self.readU4()
	}
	
	public func read(_ type: UInt16.Type) throws -> UInt16 {
		return self.readU2()
	}
	
	public func read(_ type: UInt8.Type) throws -> UInt8 {
		return self.readU1()
	}
	
	public func read(_ type: Int8.Type) throws -> Int8 {
		return self.readS1()
	}
	
	public func read(_ type: Int16.Type) throws -> Int16 {
		return self.readS2()
	}
	
	public func read(_ type: Int32.Type) throws -> Int32 {
		return self.readS4()
	}
	
	public func read(_ type: Float32.Type) throws -> Float32 {
		return self.readF4()
	}
	
}
