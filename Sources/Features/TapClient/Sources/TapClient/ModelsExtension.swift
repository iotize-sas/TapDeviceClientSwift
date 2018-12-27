//
//  ModelExtension.swift
//  TapClient
//
//  Created by dev@iotize.com on 27/12/2018.
//

import Foundation
import IotizeCore
import TapClientApi

public extension TapRequest {
	
	public static func fromBytes(bytes: Bytes) -> TapRequest {
		return TapStreamReader(withBytes: bytes).readTapRequest()
	}
	
	public var description: String{
		return self.header.description + (self.payload != nil ? " " + self.payload.hexstr : "")
	}
}

public extension ApduRequest {
	
	public static func fromBytes(bytes: Bytes) -> ApduRequest {
		return TapStreamReader(withBytes: bytes).readApduRequest()
	}
}

public extension TapRequestHeader.MethodType {
	
	var description : String {
		switch self {
		case .GET:
			return "GET"
		case .POST:
			return "POST"
		case .PUT:
			return "PUT"
		}
	}
}

public extension ApduRequest {
	
	public var description : String {
		return "APDU " + self.header.description + " " + self.data.hexstr
	}
}

public extension ApduRequestHeader {
	
	public var description : String {
		return "cla=" + String(self.cla) + ", len=" + String(self.lc)
	}
}

public extension ApduResponse {
	
	public var description : String {
		return "SW1/SW2=" + self.status.hexstr + " DATA=" + self.data.hexstr
	}
}

public extension TapResponse {
	
	public var description : String {
		return "Code=" + self.codeRet.hexstr + " DATA=" + self.data.hexstr
	}
	
//	public func body<T>(_ type: T.Type) throws -> T where T: Decodable{
//		return try TapStreamDecoder().decode(type, from: self.data)
//	}
	
}

public extension TapRequestHeader {
	
	public var description : String {
		return self.methodType.description + " " + self.path.description
	}
}


public extension TapRequestHeader.Path{
	
	public var description : String {
		return "/" + String(self.objectId) + "/" + String(self.objectInstanceId) + "/" + String(self.resourceId)
	}
}

public extension TapResponse {
	
	func successful() -> Bool {
		return self.codeRet & UInt8(0b10000000) == 0
	}
	
	static func SUCCESS() -> TapResponse {
		return TapResponse(codeRet: 0x69, data: [UInt8]())
	}
	
	func encode() -> Bytes {
		return TapStreamWriter().writeTapResponse(self).toBytes()
	}
	
}
