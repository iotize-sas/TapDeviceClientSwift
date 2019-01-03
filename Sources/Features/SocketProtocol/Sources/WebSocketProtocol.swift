import Foundation
import IotizeCore
import SocketIO
import RxSwift
import TapClientApi
import Starscream
import RxBlocking



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
		try self.p.connect().toBlocking().first()
		return 1
	}
	
	public func disconnect() throws -> Any {
		try self.p.connect().toBlocking().first()
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
		try self.p.write(data: data).toBlocking().first()
	}
	
	
}

public class RxWebSocketProtocol: RxComProtocol {
	
	var connectionState: ConnectionState
	var socket: WebSocket
	var _messages: PublishSubject<[UInt8]>?
	
	public func getConnectionState() -> ConnectionState {
		return self.connectionState
	}
	
	public init(url: URL){
		self.connectionState = ConnectionState.DISCONNECTED
		self.socket = WebSocket(url: url)
//		self.socket.delegate = self
		self.socket.onData = { data in
			self.onData(data: Array(data))
		}
		self.socket.onDisconnect = { data in
			// TODO
		}
	}
	
	public func connect() -> Observable<Any>{
		self.connectionState = ConnectionState.CONNECTING
		self._messages = PublishSubject()
		return RxSwift.Observable.create { observer in
			self.socket.onConnect = {
				observer.onCompleted()
			}
			self.socket.connect()
			return Disposables.create()
		}
	}
	
	public func disconnect() -> Observable<Any>{
		self.connectionState = ConnectionState.DISCONNECTING
		self._messages?.onCompleted()
		return RxSwift.Observable.create { observer in
			self.socket.disconnect()
			self.connectionState = ConnectionState.DISCONNECTED
			observer.onCompleted()
			return Disposables.create()
		}
	}
	
	public func onData(data: [UInt8]) {
		self._messages!.onNext(data)
	}
	
	public func write(data: [UInt8]) -> Observable<Any>{
		return RxSwift.Observable.create { observer in
			self.socket.write(data: Data(data))
			observer.onCompleted()
			return Disposables.create()
		}
	}
	
	public func read() -> Observable<[UInt8]>{
		return self._messages!.single()
	}
	
}
