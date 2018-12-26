import TapResponse

extension TapRespone {
    func successful(): Bool {
        return self.codeRet & 0b1000000
    }

}

class TapClient(): ITapClient{

    var _protocol: ComProtocol

    func connect(){
        _protocol.connect()
    }
    
    func disconnect(){
        _protocol.disconnect()
    }

    func GET(at path: String, _ data: Bytes){
        return self.send(createRequest(MethodType.GET, path, data))
    }
    
    func PUT(at path: String, _ data: Bytes){
        return self.send(createRequest(MethodType.PUT, path, data))
    }

    func POST(at path: String, _ data: Bytes){
        return self.send(createRequest(MethodType.POST, path, data))
    }

    func send(_ request: TapRequest): TapResponse{
        var requestBytes = self._encodeRequest(request)
        _protocol.write(requestBytes)
        var responseBytes = _protocol.read()
        var tapResponse = self._decodeResponse(responseBytes)
        return tapResponse
    }

    func _encodeRequest(_ request: TapRequest): Bytes{
        if (streamWriter == null){
            streamWriter = KaitaiStreamWriter()
        }
        let tapRequestBytes = streamWriter.writeTapRequest(tapRequest).toBytes()

        var apduRequest = ApduRequest()
        apduRequest.header = ApduRequestHeader()
        apduRequest.header.cla = TapApduRequest.Default.Cla
        apduRequest.header.p1 = 0
        apduRequest.header.p2 = 0

        switch method {
        case MethodType.GET:
            apduRequest.header.ins = TapApduRequest.MethodType.GET
        case MethodType.PUT:
        case MethodType.POST:
            apduRequest.header.ins = TapApduRequest.MethodType.PUT_OR_POST
        default:
            throw Error("Invalid method type ")
        }
        apduRequest.header.lc = 0    
        apduRequest.data = streamWriter.getBytes()

        streamWriter.seek(0)
        return streamWriter.writeApduRequest(apduRequest).getBytes()
    }

    func _decodeResponse(_ data: Bytes): TapResponse{
        var apduResponse = KaitaiStreamReader(data).readApduResponse()
        if (apduResponse.status){
            // TODO check valid APDU
        }
        return KaitaiStreamReader(apduResponse.data).readTapResponse()
    }

    func createRequest(_ method: MethodType, _ path: String, _ data: Bytes){
        return TapRequest(
            method,
            self.createPathFromString(path),
            data
        )
    }

    func createPathFromString(_ path: String): TapRequestPath{
        let parts = path.split("/")
        if (parts.length != 4){

        }
        let objectId = parts[1].toInt()
        let objectInstanceId = parts[2].toInt()
        let resourceId = parts[3].toInt()
        let tapRequestPath = TapRequestPath(objectId, objectInstanceId, resourceId)
        return tapRequestPath
    }

    func setProtocol(_ _protocol ComProtocol){
        self._protocol = _protocol
    }
}
