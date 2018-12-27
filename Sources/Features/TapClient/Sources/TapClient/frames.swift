
public extension TapStreamReader {

    func readTapRequestHeader() -> TapRequestHeader {
        let model = TapRequestHeader()
        model.methodType = TapRequestHeader.MethodType(rawValue:self.readU1())

        model.path = self.readTapRequestHeaderPath()
        return model
    }
    
    func readTapRequestHeaderPath() -> TapRequestHeader.Path {
        let model = TapRequestHeader.Path()
        model.objectId = self.readU2()
        model.objectInstanceId = self.readU2()
        model.resourceId = self.readU2()
        return model
    }
    

    func readTapRequest() -> TapRequest {
        let model = TapRequest()
        model.header = self.readTapRequestHeader()
        model.payload = self.readBytes()
        return model
    }
    

    func readTapResponse() -> TapResponse {
        let model = TapResponse()
        model.codeRet = self.readU1()
        model.data = self.readBytes()
        return model
    }
    

    func readTapApduRequest() -> TapApduRequest {
        let model = TapApduRequest()
        model.header = self.readTapApduRequestHeader()
        model.request = self.readTapRequest()
        return model
    }
    
    func readTapApduRequestHeader() -> TapApduRequest.Header {
        let model = TapApduRequest.Header()
        model.cla = self.readU1()
        model.ins = self.readU1()
        model.p1 = self.readU1()
        model.p2 = self.readU1()
        model.lc = self.readU1()
        return model
    }
    

    func readApduResponse() -> ApduResponse {
        let model = ApduResponse()
        model.data = self.readBytes(length: Int(self._io._length - 2))
        model.status = self.readBytes(length: Int(2))
        return model
    }
    

    func readApduRequest() -> ApduRequest {
        let model = ApduRequest()
        model.header = self.readApduRequestHeader()
        model.data = self.readBytes(length: Int(model.header.lc))
        return model
    }
    

    func readApduRequestHeader() -> ApduRequestHeader {
        let model = ApduRequestHeader()
        model.cla = self.readU1()
        model.ins = self.readU1()
        model.p1 = self.readU1()
        model.p2 = self.readU1()
        model.lc = self.readU1()
        return model
    }
    

    func readIotizeEncryptedFrame() -> IotizeEncryptedFrame {
        let model = IotizeEncryptedFrame()
        model.id = self.readU2()
        model.len = self.readU2()
        model.payload = self.readBytes(length: Int(model.len))
        model.crc = self.readU4()
        return model
    }
    

}

public extension TapStreamWriter {

    func writeTapRequestHeader(_ model: TapRequestHeader) -> TapStreamWriter{
        self.writeU1(model.methodType.rawValue)
        self.writetap_request_headerpath(model.path)
        return self
    }

    
    func writeTapRequestHeaderPath(_ model: TapRequestHeader) -> TapStreamWriter{
        self.writeU2(model.objectId)
        self.writeU2(model.objectInstanceId)
        self.writeU2(model.resourceId)
        return self
    }
    


    func writeTapRequest(_ model: TapRequest) -> TapStreamWriter{
        self.writetap_request_header(model.header)
        self.writeBytes(model.payload)
        return self
    }

    


    func writeTapResponse(_ model: TapResponse) -> TapStreamWriter{
        self.writeU1(model.codeRet)
        self.writeBytes(model.data)
        return self
    }

    


    func writeTapApduRequest(_ model: TapApduRequest) -> TapStreamWriter{
        self.writetap_apdu_requestheader(model.header)
        self.writetap_request(model.request)
        return self
    }

    
    func writeTapApduRequestHeader(_ model: TapApduRequest) -> TapStreamWriter{
        self.writeU1(model.cla)
        self.writeU1(model.ins)
        self.writeU1(model.p1)
        self.writeU1(model.p2)
        self.writeU1(model.lc)
        return self
    }
    


    func writeApduResponse(_ model: ApduResponse) -> TapStreamWriter{
        self.writeBytes(model.data)
        self.writeBytes(model.status)
        return self
    }

    


    func writeApduRequest(_ model: ApduRequest) -> TapStreamWriter{
        self.writeapdu_request_header(model.header)
        self.writeBytes(model.data)
        return self
    }

    


    func writeApduRequestHeader(_ model: ApduRequestHeader) -> TapStreamWriter{
        self.writeU1(model.cla)
        self.writeU1(model.ins)
        self.writeU1(model.p1)
        self.writeU1(model.p2)
        self.writeU1(model.lc)
        return self
    }

    


    func writeIotizeEncryptedFrame(_ model: IotizeEncryptedFrame) -> TapStreamWriter{
        self.writeU2(model.id)
        self.writeU2(model.len)
        self.writeBytes(model.payload)
        self.writeU4(model.crc)
        return self
    }

    


}
