//
//  BlueSocketProtocol.swift
//  BLEProtocol_iOS
//
//  Created by dev@iotize.com on 08/01/2019.
//

import Foundation
import Socket
import TapClientApi

public class TapSocketProtocol: BlueSocketProtocol {

}

/*!
 * Tap device socket protocol adapter using IBM blue socket
 */
class BlueSocketProtocol: ComProtocol {
	
	var socket: Socket?
	var url: URL
	var connectionState: ConnectionState
	
	
	public init(url: URL){
		self.url = url
		self.connectionState = ConnectionState.DISCONNECTED
	}
	
	public func getConnectionState() -> ConnectionState {
		if (self.socket == nil && connectionState != ConnectionState.DISCONNECTED){
			self.connectionState =  ConnectionState.DISCONNECTED
		}
		return self.connectionState
	}
	
	public func connect() throws -> Any {
		return try self.connect(timeout: 3000)
	}
	
	public func connect(timeout: UInt) throws -> Any {
		self.socket = try Socket.create()
		try self.socket!.connect(
			to: self.url.host ?? "localhost",
			port: Int32(self.url.port ?? 2000),
			timeout: timeout
		)
		self.connectionState = ConnectionState.CONNECTED
		return 1
	}
	
	public func disconnect() throws -> Any {
		self.socket?.close()
		self.connectionState = ConnectionState.DISCONNECTED
		return 1
	}
	
	public func send(data: Bytes) throws -> Bytes {
		try self._checkSocket()
		try self.write(data: data)
		return try self.read()
	}
	
	public func read() throws -> Bytes {
		try self._checkSocket()
		var data = Data()
		_ = try self.socket!.read(into: &data)
		return [UInt8](data)
	}
	
	public func write(data: Bytes) throws {
		try self._checkSocket()
		try self.socket!.write(from: Data(data))
	}
	
	func _checkSocket() throws {
		if (self.socket == nil || !self.socket!.isConnected) {
			throw TapComProtocolError.notConnected
		}
	}
}
