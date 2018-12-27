//
//  RequestBuilder.swift
//  BLEProtocol_iOS
//
//  Created by dev@iotize.com on 28/12/2018.
//

import Foundation
import TapClientApi
import CryptoSwift
import IotizeCore
import RxSwift

public protocol TapRequestInterceptor {
	
	func intercept(request: TapRequest, next: TapRequestHandler) throws -> ApiResponse<Any>
	
}

public protocol TapRequestHandler {
	func handle(bytes: Bytes) -> Bytes
}

public class TapRequestEvent<Type>{
	
}

//public protocol TapRequestBuilder {
//
//	func build(request: TapRequest) throws -> Bytes
//}

// Wrap request with APDU request format and unwrap result from APDU response
public class ApduRequestInterceptor: TapRequestInterceptor {
	public init(){
		
	}
	
	public func intercept(request: TapRequest, next: TapRequestHandler) -> ApiResponse<Any> {
		let apduFrame = try! self.buildRequest(request: request)
		let responseBytes = next.handle(bytes: apduFrame)
		let tapResponse = self._decodeResponse(responseBytes)
		return ApiResponse(response: tapResponse)
	}
	
	public func buildRequest(request: TapRequest) throws -> Bytes {
		return try self.wrapWithApduAndEncode(request)
	}
	
	
	func _decodeResponse(_ data: Bytes) -> TapResponse{
		var apduResponse = TapStreamReader(withBytes: data).readApduResponse()
		if ((apduResponse.status) != nil){
			// TODO check valid APDU
		}
		return TapStreamReader(withBytes: apduResponse.data!).readTapResponse()
	}
	
	func wrapWithApduAndEncode(_ request: TapRequest) throws -> Bytes {
		let streamWriter = TapStreamWriter()
		let tapRequestBytes = streamWriter.writeTapRequest(request).toBytes()
		
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
		streamWriter.clear()
		return streamWriter.writeApduRequest(apduRequest).toBytes()
	}
	
}

//public protocol TypeConverter<T> {
//	
//	public func encode(v: T) throws  -> Bytes
//	
//	public func decode(bytes: Bytes) throws -> T
//	
//}

public protocol EncryptionAlgo {

	func encode(bytes: Bytes) throws -> Bytes;

	func decode(bytes: Bytes) throws -> Bytes;

}

public class AesCBBC128Encryption: EncryptionAlgo {
	
	var aesEngine: AES
	
	public init(key: Bytes, iv: Bytes = [UInt8](repeating: 0, count: 16)) throws {
		if (key.count != 16){
			// TODO throw key must be 16 bytes for AES 128 bits
			throw IotizeError.runtimeError("Expected key to have a size of 16 bytes. Found " + String(key.count) + " bytes")
		}
		let blockMode = CBC(iv: iv)
		self.aesEngine = try AES(key: key, blockMode: blockMode, padding: CryptoSwift.Padding.zeroPadding)
	}
	
	public func encode(bytes: Bytes) throws -> Bytes {
		if bytes.count == 0 {
			return bytes
		}
		var encoded = try self.aesEngine.encrypt(bytes)
		if encoded.count > bytes.count {
			encoded = Array(encoded[0...bytes.count-1])
		}
		return encoded
	}
	
	public func decode(bytes: Bytes) throws -> Bytes {
		return try self.aesEngine.decrypt(bytes)
	}
}


public class EncryptedRequestBuilder: TapRequestInterceptor {
	
	var requestId: UInt16
	var innerRequestBuilder: TapRequestInterceptor
	var encryptionAlgo: EncryptionAlgo
	
	public init(encryptionAlgo: EncryptionAlgo, innerRequestBuilder: TapRequestInterceptor = ApduRequestInterceptor()){
		self.innerRequestBuilder = innerRequestBuilder
		self.encryptionAlgo = encryptionAlgo
		self.requestId = 1
	}
	
	public func intercept(request: TapRequest, next: TapRequestHandler) throws -> ApiResponse<Any>  {
		throw IotizeError.notImplemented
	}
	
	
	func intercept(frame: Bytes, next: TapRequestHandler) throws -> Bytes {
		let encryptedFrame = try self.encrypt(frame: frame)
		let encryptedResponse = next.handle(bytes: encryptedFrame)
		return try self.decrypt(encryptedFrame: encryptedResponse)
	}
	
	public func decrypt(encryptedFrame: Bytes) throws -> Bytes {
		let frame = try self.encryptionAlgo.decode(bytes: encryptedFrame)
		let payload = TapStreamReader(withBytes: frame).readIotizeEncryptedFrame().payload
		return payload!
	}

	public func encrypt(frame: Bytes) throws -> Bytes {
		let encryptedFrameModel = IotizeEncryptedFrame(id: self.requestId, len: UInt16(frame.count), payload: frame, crc: 0)
		self.requestId += 1
		let frameWrapperBytes = TapStreamWriter().writeIotizeEncryptedFrame(encryptedFrameModel).toBytes()
		let encryptedFrame = try self.encryptionAlgo.encode(bytes: frameWrapperBytes)
		return encryptedFrame
	}
	
}
