

public typealias Bytes = [UInt8]

public enum ConnectionState{
	case CONNECTED
	case CONNECTING
	case DISCONNECTING
	case DISCONNECTED
}

public protocol TapCodable {
	var description: String { get }
}

public enum TapCodableError: Error{
	case noDecoder
}

public protocol ComProtocol{
	
	func getConnectionState() -> ConnectionState
	
	func connect() throws -> Any
	func disconnect() throws -> Any
	
	func send(data: Bytes) throws -> Bytes
	func read() throws  -> Bytes
	func write(data: Bytes) throws 
	
}

public protocol ConnectionStateAware {
	var connectionState: ConnectionState { get set}
	
}

public protocol ITapClient{
	
	func connect()
	func disconnect()
	
	// func send(Command)
	
	func GET(path: String, _ data: Bytes?)
	func PUT(path: String, _ data: Bytes?)
	func POST(path: String, _ data: Bytes?)
	
	func setProtocol(_ _protocol: ComProtocol)
}
