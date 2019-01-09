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

///
/// Wrap request with APDU request format and unwrap result from APDU response
/// 
public class ApduRequestInterceptor: TapRequestInterceptor {
	public init(){
		
	}
	
	public func intercept(request: TapRequest, next: TapRequestHandler) throws -> ApiResponse<Any> {
		let apduFrame = try! self.buildRequest(request: request)
		let responseBytes = try next.handle(bytes: apduFrame)
		let tapResponse = self._decodeResponse(responseBytes)
		return ApiResponse(response: tapResponse)
	}
	
	public func buildRequest(request: TapRequest) throws -> Bytes {
		return try self.wrapWithApduAndEncode(request)
	}
	
	
	func _decodeResponse(_ data: Bytes) -> TapResponse{
		let apduResponse = TapStreamReader(withBytes: data).readApduResponse()
		if ((apduResponse.status) != nil){
			// TODO check valid APDU
		}
		return TapStreamReader(withBytes: apduResponse.data!).readTapResponse()
	}
	
	func wrapWithApduAndEncode(_ request: TapRequest) throws -> Bytes {
		let apduRequest = ApduRequest.from(tapRequest: request)
		return TapStreamWriter().writeApduRequest(apduRequest).toBytes()
	}
	
}


public class EncryptedRequestInterceptor: TapRequestInterceptor {
	
	var requestId: UInt16
	var innerRequestBuilder: TapRequestInterceptor
	var encryptionAlgo: EncryptionAlgo
	
	public init(encryptionAlgo: EncryptionAlgo, innerRequestBuilder: TapRequestInterceptor = ApduRequestInterceptor()){
		self.innerRequestBuilder = innerRequestBuilder
		self.encryptionAlgo = encryptionAlgo
		self.requestId = 1
	}
	
	public func intercept(request: TapRequest, next: TapRequestHandler) throws -> ApiResponse<Any>  {
		let requestBytes = TapStreamWriter().writeTapRequest(request).toBytes()
		let responseBytes = try self.intercept(frame: requestBytes, next: next)

		let tapResponse = TapStreamReader(withBytes: responseBytes).readTapResponse()
		return ApiResponse(response: tapResponse)
	}
	
	
	func intercept(frame: Bytes, next: TapRequestHandler) throws -> Bytes {
		let encryptedFrame = try self.encrypt(frame: frame)
		let apiRequest = ApiRequest<Bytes>(method: TapRequestHeader.MethodType.GET, path: "/1024//48", body: encryptedFrame)
		let apiRequestFrame = try apiRequest.asFrame()
		let apduResponseFrame = try next.handle(bytes: apiRequestFrame)
		let apduInnerResponseBytes = try self.decrypt(apduResponseFrame: apduResponseFrame)
		let apduInnerResponse: ApduResponse = TapStreamReader(withBytes: apduInnerResponseBytes).readApduResponse()
		if (apduInnerResponse.status != ApduStatusCode.SUCCESS.rawValue){
			throw APIError.apduResponseError(apdu: apduInnerResponse)
		}
		return apduInnerResponse.data
	}
	
	public func decrypt(apduResponseFrame: Bytes) throws -> Bytes {
		print("Encrypted response: " + apduResponseFrame.hexstr)
		let apduResponse: ApduResponse = TapStreamReader(withBytes: apduResponseFrame).readApduResponse()
		if (apduResponse.status != ApduStatusCode.SUCCESS.rawValue){
			throw APIError.apduResponseError(apdu: apduResponse)
		}
		let tapResponse = TapStreamReader(withBytes: apduResponse.data).readTapResponse()
		let frameWrapper = try self.encryptionAlgo.decode(bytes: tapResponse.data)
		print("Decrypted response: " + frameWrapper.hexstr)
		let payload = TapStreamReader(withBytes: frameWrapper).readIotizeEncryptedFrame().payload
		return payload!
	}

	public func encrypt(frame: Bytes) throws -> Bytes {
		let encryptedFrameModel = IotizeEncryptedFrame(
			id: self.requestId,
			payload: frame
		)
		self.requestId += 1
		let frameWrapperBytes = TapStreamWriter().writeIotizeEncryptedFrame(encryptedFrameModel).toBytes()
		let encryptedFrame = try self.encryptionAlgo.encode(bytes: frameWrapperBytes)
		return encryptedFrame
	}
	
}
