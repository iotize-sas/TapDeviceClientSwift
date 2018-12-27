import Foundation


public extension Collection where Element == UInt8 {
	public var data: Data {
		return Data(self)
	}
	public var hexstr: String {
		return map{ String(format: "%02X", $0) }.joined()
	}
	public var ascii: String {
		return String(bytes: self, encoding: .ascii) ?? ""
	}
}

public extension String {
	public var hexbytes: [UInt8] {
		//		var result = self.trimmingCharacters(in: .whitespacesAndNewlines)
		var result = self.replacingOccurrences(of: "\\s", with: "", options: .regularExpression)
		if (result.count % 2 != 0) {
			result = "0" + result
		}
		let hexa = Array(result)
		return stride(from: 0, to: hexa.count, by: 2)
			.compactMap {
				UInt8(String(hexa[$0...$0.advanced(by: 1)]), radix: 16)
		}
	}
	
}

public enum IotizeError: Error {
	case runtimeError(String)
	case notImplemented
}

public extension UInt8 {
	public var hexstr: String {
		return String(format: "%02X", self)
	}
}
public class TestIotizeCore{
	
	public init(){
		
	}
}
