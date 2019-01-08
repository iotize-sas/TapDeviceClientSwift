//
//  MockProtocol.swift
//  Core
//
//  Created by dev@iotize.com on 27/12/2018.
//

import Foundation
import TapClientApi


public class MockProtocol: ComProtocol {
	var connectionState = ConnectionState.DISCONNECTED
	
	var mapping = [[UInt8]: [UInt8]]()
	var responseQueue = Queue<[UInt8]>()
	var writeQueue = Queue<[UInt8]>()
	var onSend: (_ bytes: Bytes) -> Bytes
	
	init(onSend: @escaping (_ bytes: Bytes) -> Bytes){
		self.onSend = onSend
	}
	
	public func connect() -> Any{
		connectionState = ConnectionState.CONNECTED
		return 1
	}
	
	public func disconnect() -> Any {
		connectionState = ConnectionState.DISCONNECTED
		return 1
	}
	
	public func send(data: Bytes) -> Bytes {
		return self.onSend(data)
	}
	
	public func read() -> Bytes {
		let response = self.responseQueue.dequeue()
		return response!
	}
	
	public func write(data: Bytes) {
		return self.writeQueue.enqueue(data)
	}
	
	public func getConnectionState() -> ConnectionState {
		return connectionState
	}
	
	public static func fromJSONSnapshot(path: String) throws -> MockProtocol{
		var mapping = [[UInt8]: [UInt8]]()
		let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
		let rawData =  try JSONDecoder().decode(JSONSnapshotType.self, from: data)
		
		for (key, value) in rawData {
			let request: TapRequest = try TapRequest.fromString(key)
			let response: TapResponse = try TapResponse.fromString(value)
			let requestBytes = TapStreamWriter().write(ApduRequest.from(tapRequest: request)).toBytes()
			let responseBytes = TapStreamWriter().write(ApduResponse(data: TapStreamWriter().write(response).toBytes(), status: ApduStatusCode.SUCCESS.rawValue)).toBytes()
			mapping[requestBytes] = responseBytes
		}
		let p = MockProtocol { bytes in
			var response = mapping[bytes]
			if (response == nil){
				response = TapStreamWriter().write(TapResponse(codeRet: TapResultCode.NOT_IMPLEMENTED, data: [UInt8]())).toBytes()
				let apduResponse = ApduResponse(data: response!, status: ApduStatusCode.SUCCESS.rawValue)
				return TapStreamWriter().write(apduResponse).toBytes()
			}
			else {
				return response!
			}
		}
		
		return p
	}
	
	
}


typealias JSONSnapshotType = [String: String]
