//
//  TapClient.swift
//  Core
//
//  Created by Stephane on 26/12/2018.
//

import Foundation

//extension TapRespone {
//	func successful() -> Bool {
//		return self.codeRet & 0b1000000
//	}
//
//}

public typealias Bytes = [UInt8]

public protocol ComProtocol{
	
	func connect()
	func disconnect()
	
	func read() -> Bytes
	func write(data: Bytes)
	
}

public protocol ITapClient{
	
	func connect()
	func disconnect()
	
	// func send(Command)
	
	func GET(at path: String, _ data: Bytes?)
	func PUT(at path: String, _ data: Bytes?)
	func POST(at path: String, _ data: Bytes?)
	
	func setProtocol(_ _protocol: ComProtocol)
}


public enum TapClientError: Error {
	case invalidMethodType
}


public class ApiRequest<DataType> {
	
	init( method: TapRequestHeader.MethodType, path: String, body: Any? = nil){
		
	}
}

public class TapClient {
	
	var _protocol: ComProtocol
	
	init() {
		
	}
	
	func connect(){
		_protocol.connect()
	}
	
	func disconnect(){
		_protocol.disconnect()
	}
	
	func GET(at path: String, _ data: Bytes) throws -> TapResponse {
		return try self.send(self.createRequest(.GET, path, data))
	}
	
	func PUT(at path: String, _ data: Bytes) throws -> TapResponse {
		return try self.send(self.createRequest(.PUT, path, data))
	}
	
	func POST(at path: String, _ data: Bytes) throws  -> TapResponse {
		return try self.send(self.createRequest(.POST, path, data))
	}
	
	func send(_ request: TapRequest) throws -> TapResponse {
		let requestBytes = try self._encodeRequest(request)
		_protocol.write(data: requestBytes)
		let responseBytes = _protocol.read()
		let tapResponse = self._decodeResponse(responseBytes)
		return tapResponse
	}
	
	func _encodeRequest(_ request: TapRequest) throws -> Bytes {
		let streamWriter = TapStreamWriter()
		let tapRequestBytes = streamWriter.writeTapRequest(model: request).toBytes()
		
		var apduRequest = ApduRequest()
		apduRequest.header = ApduRequestHeader()
		apduRequest.header.cla = TapApduRequest.Default.CLA.rawValue
		apduRequest.header.p1 = 0
		apduRequest.header.p2 = 0
		
		switch request.header.methodType! {
		case .GET:
			apduRequest.header.ins = TapApduRequest.MethodType.GET.rawValue
			break
		case .PUT:
			apduRequest.header.ins = TapApduRequest.MethodType.PUT_OR_POST.rawValue
			break
		case .POST:
			apduRequest.header.ins = TapApduRequest.MethodType.PUT_OR_POST.rawValue
			break
		default:
			throw TapClientError.invalidMethodType
		}
		apduRequest.header.lc = 0
		apduRequest.data = streamWriter.toBytes()
		
		streamWriter.seek(toPosition: 0)
		return streamWriter.writeApduRequest(apduRequest).toBytes()
	}
	
	func _decodeResponse(_ data: Bytes) -> TapResponse{
		var apduResponse = TapStreamReader(withBytes: data).readApduResponse()
		if ((apduResponse.status) != nil){
			// TODO check valid APDU
		}
		return KaitaiStreamReader(data: apduResponse.data!).readTapResponse()
	}
	
	func createRequest(_ method: TapRequestHeader.MethodType, _ path: String, _ data: Bytes) -> TapRequest {
		let request = TapRequest()
		request.header.path = self.createPathFromString(path)
		request.header.methodType = method
		request.payload = data
		return request
	}
	
	func createPathFromString(_ path: String) -> TapRequestHeader.Path{
		let parts = path.split(separator: "/")
		if (parts.count != 4){
			
		}
		let objectId = Int(parts[1])
		let objectInstanceId = Int(parts[2])
		let resourceId = Int(parts[3])
		let tapRequestPath = TapRequestHeader.Path(objectId, objectInstanceId, resourceId)
		return tapRequestPath
	}
	
	func setProtocol(_ p: ComProtocol){
		self._protocol = p
	}
}
