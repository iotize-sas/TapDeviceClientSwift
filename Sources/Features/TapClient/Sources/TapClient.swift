//
//  TapClient.swift
//  Core
//
//  Created by Stephane on 26/12/2018.
//

import Foundation
import TapClientApi
import IotizeCore

public extension ConnectionStateAware {
	
	func getConnectionState() -> ConnectionState {
		return self.connectionState
	}
}



//public class QueueComProtocol: ComProtocol, ConnectionStateAware {
//	public func connect(timeout: UInt? = nil) {
//
//	}
//
//	public func disconnect(timeout: UInt? = nil) {
//
//	}
//
//	public func read(timeout: UInt? = nil) -> Bytes {
//		<#code#>
//	}
//
//	public func write(data: Bytes, timeout: UInt? = nil) {
//		<#code#>
//	}
//
//	public var connectionState: ConnectionState
//}


public enum TapClientError: Error {
	case invalidMethodType
	case invalidPathFormat
}

public class ApiRequest<BodyType> { // : Encodable
	
	public var method: TapRequestHeader.MethodType
	public var path : String
	public var body : BodyType?
	public var bodyEncoder: TapConverterContainer<BodyType>?
//	public var returnType: ReturnType.Type?
	
	init(method: TapRequestHeader.MethodType, path: String){
		self.method = method
		self.path = path
		self.body = nil
		self.bodyEncoder = nil
	}
	
	init( method: TapRequestHeader.MethodType, path: String, body: BodyType
		, bodyEncoder: TapConverterContainer<BodyType>? = nil
		){
		self.method = method
		self.path = path
		self.body = body
		self.bodyEncoder = bodyEncoder
	}
}

public enum TapError<T>: Error {
	case tapRespondedWithError(response: ApiResponse<T>)
}
public class ApiResponse<DataType>{
	
	var response: TapResponse
//	var dataType: DataType.Type?
	var converter: TapConverterContainer<DataType>?
	
	init(response: TapResponse, converter: TapConverterContainer<DataType>? = nil){
		self.response = response
//		self.dataType = dataType
		self.converter = converter
	}
	
	public func successful() throws {
		if (!self.response.successful()){
			throw TapError.tapRespondedWithError(response: self)
		}
	}
	
	public func body() throws -> DataType {
		try self.successful()
//		return try TapStreamDecoder().decode(self.dataType!, from: self.response.data)
		if (self.converter != nil){
			return self.converter!.decode(stream: TapStreamReader(withBytes: self.response.data!))
		}
//		else if (self.response.data is Bytes){
//			return self.response.data as! DataType // TODO check it's Bytes
//		}
		else {
			throw IotizeError.notImplemented // TODO illegal argument
		}
	}
}

public class TapClient {
	
	var comProtocol: ComProtocol
	var _requestInterceptor: TapRequestInterceptor
	var encoder = TapStreamEncoder()
	
	init(withProtocol p: ComProtocol, requestInterceptor: TapRequestInterceptor = ApduRequestInterceptor()) {
		self.comProtocol = p
		self._requestInterceptor = requestInterceptor
	}
	
	func connect(){
		comProtocol.connect()
	}
	
	func disconnect(){
		comProtocol.disconnect()
	}
	
	func GET(path: String, body data: Bytes? = nil) throws -> TapResponse {
		return try self.COMMAND(type: .GET, path: path, body: data)
	}
	
	func PUT(path: String, body data: Bytes? = nil) throws -> TapResponse {
		return try self.COMMAND(type: .PUT, path: path, body: data)
	}
	
	func POST(path: String, body data: Bytes? = nil) throws  -> TapResponse {
		return try self.COMMAND(type: .POST, path: path, body: data)
	}
	
	func COMMAND(type: TapRequestHeader.MethodType, path: String, body: Bytes? = nil) throws  -> TapResponse {
		return try self.send(self.createRequest(type, path, body)).response
	}
	
	func execute<BodyType, ReturnType>(request: ApiRequest<BodyType>, converter: TapConverterContainer<ReturnType>? = nil) throws -> ApiResponse<ReturnType> {
		var rawBody: Bytes? = nil
		if (request.body != nil && request.bodyEncoder != nil){
//			rawBody = try encoder.encode(request.body!)
			rawBody = request.bodyEncoder!.encode(model: request.body!).toBytes()
		}
		let response = try self.COMMAND(type: request.method, path: request.path, body: rawBody)
		return ApiResponse(response: response, converter: converter)
	}
	
	func send(_ request: TapRequest) throws -> ApiResponse<Any> {
		let baseInterceptor = SendFrameHandler(client: self)
		return try self._requestInterceptor.intercept(request: request, next: baseInterceptor)
//		_protocol.write(data: requestBytes)
//		let responseBytes = _protocol.read()
//		let responseBytes = _protocol.send(data: requestBytes)
//		let tapResponse = self._decodeResponse(responseBytes)
//		return tapResponse
//		throw IotizeError.notImplemented
	}
	
	
	func createRequest(_ method: TapRequestHeader.MethodType, _ path: String, _ data: Bytes? = nil) throws -> TapRequest {
		let request = TapRequest()
		request.header = TapRequestHeader()
		request.header.path = try self.createPathFromString(path)
		request.header.methodType = method
		request.payload = data ?? [UInt8]()
		return request
	}
	
	func createPathFromString(_ path: String) throws -> TapRequestHeader.Path{
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
	
	func setProtocol(_ p: ComProtocol){
		self.comProtocol = p
	}
	
	
	class SendFrameHandler: TapRequestHandler {
		
		var client: TapClient
		
		init(client: TapClient){
			self.client = client;
		}
		
		func handle(bytes: Bytes) -> Bytes {
			return self.client.comProtocol.send(data: bytes)
		}
		
		
	}

}
