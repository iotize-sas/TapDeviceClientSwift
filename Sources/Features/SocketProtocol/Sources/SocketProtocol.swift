import Foundation
import Core
import SocketIO

class SocketProtocol {
	
	func hello() -> Int{
		return 1
	}
}

let manager = SocketManager(socketURL: URL(string: "http://localhost:8080")!, config: [.log(true), .compress])
let socket = manager.defaultSocket

socket.on(clientEvent: .connect) {data, ack in
	print("socket connected")
}

socket.on("currentAmount") {data, ack in
	guard let cur = data[0] as? Double else { return }
	
	socket.emitWithAck("canUpdate", cur).timingOut(after: 0) {data in
		socket.emit("update", ["amount": cur + 2.50])
	}
	
	ack.with("Got your currentAmount", "dude")
}

socket.connect()
