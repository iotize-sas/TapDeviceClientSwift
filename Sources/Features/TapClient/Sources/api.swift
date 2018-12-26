protocol ComProtocol{

    func connect()
    func disconnect()

    func read(): Bytes
    func write(data: Bytes)

}

protocol ITapClient{

    func connect()
    func disconnect()

    // func send(Command)

    func GET(at path: String, _ data?: Bytes)
    func PUT(at path: String, _ data?: Bytes)
    func POST(at path: String, _ data?: Bytes)

    func setProtocol(_ _protocol ComProtocol)
}
