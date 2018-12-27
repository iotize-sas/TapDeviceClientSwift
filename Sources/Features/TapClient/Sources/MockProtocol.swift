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
		var response = self.responseQueue.dequeue()
		return response!
	}
	
	public func write(data: Bytes) {
		return self.writeQueue.enqueue(data)
	}
	
	public func getConnectionState() -> ConnectionState {
		return connectionState
	}
	
	
}
