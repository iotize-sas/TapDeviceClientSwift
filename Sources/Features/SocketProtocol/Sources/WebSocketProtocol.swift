import Foundation
import IotizeCore
import SocketIO
import RxSwift
import TapClientApi
import Starscream


public class WebSocketProtocol: RxComProtocol {
	
	var socket: WebSocket
	var _messages: PublishSubject<[UInt8]>?
	
	init(url: URL){
		self.socket = WebSocket(url: url)
//		self.socket.delegate = self
		self.socket.onData { data in
			self.onData(data)
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
	
//	public func send(data: [UInt8]) -> [UInt8] {
//
//	}
	
	public func onData(data: [UInt8]) {
		self._messages!.onNext(data)
	}
	
	public func write(data: [UInt8]) -> Observable<Any>{
		return RxSwift.Observable.create { observer in
			self.socket.write(data: data)
			observer.onCompleted()
			return Disposables.create()
		}
	}
	
	public func read() -> Observable<[UInt8]>{
		return self._messages!.single()
	}
	
}
