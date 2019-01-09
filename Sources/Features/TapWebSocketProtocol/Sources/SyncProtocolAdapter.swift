//
//  SyncProtocolAdapter.swift
//  BLEProtocol_iOS
//
//  Created by dev@iotize.com on 08/01/2019.
//

import Foundation
import TapClientApi

/**
Adapter to transform RxComProtocol to a Synchronous protocol
Testing purpose ONLY
*/
public class SyncProtocolAdapter: ComProtocol {
	
	let p: RxComProtocol
	
	public init(protocol p: RxComProtocol){
		self.p = p
	}
	
	public func getConnectionState() -> ConnectionState {
		return self.p.getConnectionState()
	}
	
	public func connect() throws -> Any {
		_ = try self.p.connect().toBlocking().first()
		return 1
	}
	
	public func disconnect() throws -> Any {
		_ = try self.p.connect().toBlocking().first()
		return 1
	}
	
	public func send(data: Bytes) throws -> Bytes {
		try self.write(data: data)
		return try self.read()
	}
	
	public func read() throws -> Bytes {
		return try self.p.read().toBlocking().first()!
	}
	
	public func write(data: Bytes) throws {
		_ = try self.p.write(data: data).toBlocking().first()
	}
	
	
}
