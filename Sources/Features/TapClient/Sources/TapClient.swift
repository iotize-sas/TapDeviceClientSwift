//
//  TapClient.swift
//  Core
//
//  Created by Stephane on 26/12/2018.
//

import Foundation
import TapClientApi
import IotizeCore
import os.log

public extension ConnectionStateAware {
	
	func getConnectionState() -> ConnectionState {
		return self.connectionState
	}
}

// TOODO
public enum APIError: Error {
	case bodyResponseParsingFailed
	case bodyParamSerializationFailed
	case apduResponseError(apdu: ApduResponse)
//	var localizedDescription: String {
//		switch self {
//		case .requestFailed: return "Request Failed"
//		case .invalidData: return "Invalid Data"
//		case .responseUnsuccessful: return "Response Unsuccessful"
//		case .jsonParsingFailure: return "JSON Parsing Failure"
//		case .jsonConversionFailure: return "JSON Conversion Failure"
//		}
//	}
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
	
	init(method: TapRequestHeader.MethodType
		, path: String
		, body: BodyType? = nil
		, bodyEncoder: TapConverterContainer<BodyType>? = nil){
		self.method = method
		self.path = path
		self.body = body
		self.bodyEncoder = bodyEncoder
	}
	
	public var description: String {
		return "ApiRequest \(self.method) \(self.path) \(self.body)"
	}
	
	public func asFrame() throws -> Bytes {
		let request = TapRequest()
		request.header = TapRequestHeader()
		request.header.path = try TapRequestHeader.Path.fromString(self.path)
		request.header.methodType = self.method
		request.payload = self.body as! Bytes ?? [UInt8]()
		return TapStreamWriter().write(ApduRequest.from(tapRequest: request)).toBytes()
	}
	
	public static func GET(path: String, body: Bytes? = nil) -> ApiRequest<Bytes>{
		return ApiRequest<Bytes>(method: TapRequestHeader.MethodType.GET, path: path, body: body)
	}
	
	public static func POST(path: String, body: Bytes? = nil) -> ApiRequest<Bytes>{
		return ApiRequest<Bytes>(method: TapRequestHeader.MethodType.POST, path: path, body: body)
	}
	
	public static func PUT(path: String, body: Bytes? = nil) -> ApiRequest<Bytes>{
		return ApiRequest<Bytes>(method: TapRequestHeader.MethodType.PUT, path: path, body: body)
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
			print("Response error " + self.description) // TODO Log
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
	
	public var description: String {
		return "ApiResponse \(self.response.description)"
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
	
	func connect() throws {
		try comProtocol.connect()
	}
	
	func disconnect() throws {
		try comProtocol.disconnect()
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
		print("Execute request: \(request.description)")
		var rawBody: Bytes? = nil
		if (request.body != nil && request.bodyEncoder != nil){
//			rawBody = try encoder.encode(request.body!)
			rawBody = request.bodyEncoder!.encode(model: request.body!).toBytes()
		}
		let response = try self.COMMAND(type: request.method, path: request.path, body: rawBody)
		let apiResponse = ApiResponse(response: response, converter: converter)
		print("Received response: \(apiResponse.description)")
		return apiResponse
		
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
		request.header.path = try TapRequestHeader.Path.fromString(path)
		request.header.methodType = method
		request.payload = data ?? [UInt8]()
		return request
	}
	
	func setProtocol(_ p: ComProtocol){
		self.comProtocol = p
	}
	
	
	class SendFrameHandler: TapRequestHandler {
		
		var client: TapClient
		
		init(client: TapClient){
			self.client = client;
		}
		
		func handle(bytes: Bytes) throws -> Bytes {
			print("Sending request frame \(bytes.hexstr)")
			return try self.client.comProtocol.send(data: bytes)
		}
		
		
	}

}
