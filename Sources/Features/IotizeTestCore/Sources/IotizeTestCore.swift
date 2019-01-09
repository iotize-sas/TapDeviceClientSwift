import Foundation

public extension Collection where Element == UInt8 {
	public var data: Data {
		return Data(self)
	}
	public var hexstr: String {
		return map{ String(format: "%02X", $0) }.joined()
	}
}

public extension String {
	public var hexbytes: [UInt8] {
		//		var result = self.trimmingCharacters(in: .whitespacesAndNewlines)
		let result = self.replacingOccurrences(of: "\\s", with: "", options: .regularExpression)
		let hexa = Array(result)
		return stride(from: 0, to: hexa.count, by: 2)
			.compactMap {
				UInt8(String(hexa[$0...$0.advanced(by: 1)]), radix: 16)
		}
	}
}
