import Foundation
import IotizeCore
import SocketIO
import RxSwift
import TapClientApi

// TODO install SwiftSocket
public class SocketProtocol: RxComProtocol {
	
//	public var connectionState: ConnectionState
	
	var socket: SocketIOClient
	var manager: SocketManager
	
	init(url: URL){
		self.manager = SocketManager(socketURL: url, config: [.log(true), .compress])
		self.socket = manager.defaultSocket
		print("Current socket status \(socket.status)")
	
		socket.on(clientEvent: .connect) {data, ack in
			print("socket connected")
		}
		
		socket.on(clientEvent: .disconnect) { (data, ack) in
			print("disconnect")
		}
		
		socket.on(clientEvent: .error) { (data, ack) in
			print("error connect")
		}


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
	
	public func getConnectionState() -> ConnectionState {
		return ConnectionState.DISCONNECTED // TODO
	}
	
	public func connect() -> Observable<Any>{
		return RxSwift.Observable.create { observer in
			self.socket.on(clientEvent: .connect) {data, ack in
				print("Client is now connected")
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
			self.socket.emit("dataTest", data)
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
