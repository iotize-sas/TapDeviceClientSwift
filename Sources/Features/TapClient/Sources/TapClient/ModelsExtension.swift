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
		return self.header.description + (self.payload != nil ? " 0x" + self.payload.hexstr : "")
	}
	
	public static func fromString(_ string: String) throws -> TapRequest {
		let parts = string.split(separator: " ")
		if (parts.count < 2){
			throw IotizeError.illegalArgument
		}
		let method = try TapRequestHeader.MethodType.fromString(String(parts[0]))
		let path = try TapRequestHeader.Path.fromString(String(parts[1]))
		let header = TapRequestHeader(methodType: method, path: path)
		var payload: Bytes = [UInt8]()
		if (parts.count >= 3){
			payload = String(parts[2]).hexbytes // TODO remove 0x
		}
		return TapRequest(header: header, payload: payload)
	}
}

public extension ApduRequest {
	
	public static func fromBytes(bytes: Bytes) -> ApduRequest {
		return TapStreamReader(withBytes: bytes).readApduRequest()
	}
	
	public static func from(tapRequest request: TapRequest) -> ApduRequest {
		let tapRequestBytes = TapStreamWriter().writeTapRequest(request).toBytes()
		
		let apduRequest = ApduRequest()
		let header = ApduRequestHeader()
		header.cla = TapApduRequest.Default.CLA.rawValue
		header.p1 = 0
		header.p2 = 0
		
		switch request.header.methodType! {
		case .GET:
			header.ins = TapApduRequest.MethodType.GET.rawValue
			break
		case .PUT:
			header.ins = TapApduRequest.MethodType.PUT_OR_POST.rawValue
			break
		case .POST:
			header.ins = TapApduRequest.MethodType.PUT_OR_POST.rawValue
			break
			//		default:
			//			throw TapClientError.invalidMethodType
		}
		header.lc = UInt8(tapRequestBytes.count)
		apduRequest.data = tapRequestBytes
		apduRequest.header = header
		return apduRequest
	}
}

public extension TapRequestHeader.Path {
	
	public static func fromString(_ path: String) throws -> TapRequestHeader.Path  {
		//		if (path.starts(with: "/")){
		//			path = path.substring(to: 1)
		//		}
		let parts = path.components(separatedBy: "/")
		if (parts.count != 4){
			throw TapClientError.invalidPathFormat
		}
		let objectId: UInt16 = UInt16(parts[1]) ?? 0xFFFF
		let objectInstanceId: UInt16 = UInt16(parts[2]) ?? 0xFFFF
		let resourceId: UInt16 = UInt16(parts[3]) ?? 0xFFFF
		return TapRequestHeader.Path(objectId: objectId, objectInstanceId: objectInstanceId, resourceId: resourceId)
	}
}

public extension TapRequestHeader.MethodType {
	
	public static func fromString(_ string: String) throws -> TapRequestHeader.MethodType  {
		switch string.lowercased() {
		case "get":
			return .GET
		case "post":
			return .POST
		case "put":
			return .PUT
		default:
			throw IotizeError.illegalArgument
		}
	}
	
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
//
//public extension ApduRequest {
//	
//	public var description : String {
//		return "APDU " + self.header.description + " " + self.data.hexstr
//	}
//}


//public extension ApduResponse {
//
//	public var description : String {
//		return "SW1/SW2=" + self.status.hexstr + " DATA=" + self.data.hexstr
//	}
//}

public extension TapResponse {
	
//	public var description : String {
//		return "Code=" + self.codeRet.hexstr + " DATA=" + (self.data?.hexstr ?? "NO")
//	}
	
	public static func fromString(_ string: String) throws -> TapResponse {
		let bytes = string.hexbytes
		if (bytes.count == 0){
			throw IotizeError.illegalArgument
		}
		return TapResponse(codeRet: bytes[0], data: Array(bytes[1...]))
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

public extension IotizeEncryptedFrame {
	
	public convenience init(id: UInt16, payload: Bytes){
		let padding = Bytes(repeating: 0, count: TapStreamWriter.computePaddingSize(count: 8 + payload.count, modulo: 16))
		let len = UInt16(payload.count)
		let crc: UInt32 = 0
		self.init(id: id, len: len, payload: payload, padding: padding, crc: crc)
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


public extension TapVersion {
	
	public var description : String {
		return String(self.major) + "." + String(self.minor) + " " + String(self.build)
	}
	
}
