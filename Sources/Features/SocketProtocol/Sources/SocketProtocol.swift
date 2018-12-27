import Foundation
import IotizeCore
import SocketIO
import RxSwift
import TapClientApi


public class SocketProtocol: RxComProtocol {
	
//	public var connectionState: ConnectionState
	
	var socket: SocketIOClient
	
	init(url: URL){
		let manager = SocketManager(socketURL: url, config: [.log(true), .compress])
		self.socket = manager.defaultSocket
//		self.socket.on(clientEvent: SocketClientEvent.RawValue, callback: { ([Any], SocketAckEmitter) in
//			//observer.onNext([UInt8])
//			print("Event:")
//		})
//		self.socket.on("currentAmount") {data, ack in
//			guard let cur = data[0] as? Double else { return }
//			
//			self.socket.emitWithAck("canUpdate", cur).timingOut(after: 0) {data in
//				self.socket.emit("update", ["amount": cur + 2.50])
//			}
//			
//			ack.with("Got your currentAmount", "dude")
//		}
	}
	
	public func connect() -> Observable<Any>{
		return RxSwift.Observable.create { observer in
			self.socket.on(clientEvent: .connect) {data, ack in
				observer.onCompleted()
			}
			
			self.socket.connect()
			return Disposables.create()
		}
	}
	
	public func disconnect() -> Observable<Any>{
		return RxSwift.Observable.create { observer in
			self.socket.disconnect()
			observer.onCompleted()
			return Disposables.create()
		}
	}
	
	public func write(data: [UInt8]) -> Observable<Any>{
		return RxSwift.Observable.create { observer in
			self.socket.emit("test", data)
			observer.onCompleted()
			return Disposables.create()
		}
	}
	
	public func read() -> Observable<[UInt8]>{
		return RxSwift.Observable.create { observer in
			observer.onCompleted()
			return Disposables.create()
		}
	}

}
