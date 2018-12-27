import TapClientApi

public extension TapStreamReader {



	public func read(_ type: TapRequestHeader.Type) throws -> TapRequestHeader {
        return self.readTapRequestHeader()
	}

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
    


	public func read(_ type: TapRequest.Type) throws -> TapRequest {
        return self.readTapRequest()
	}

    func readTapRequest() -> TapRequest {
        let model = TapRequest()
        model.header = self.readTapRequestHeader()
        model.payload = self.readBytes()
        return model
    }

    


	public func read(_ type: TapResponse.Type) throws -> TapResponse {
        return self.readTapResponse()
	}

    func readTapResponse() -> TapResponse {
        let model = TapResponse()
        model.codeRet = self.readU1()
        model.data = self.readBytes()
        return model
    }

    


	public func read(_ type: TapApduRequest.Type) throws -> TapApduRequest {
        return self.readTapApduRequest()
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
    


	public func read(_ type: TapMultiRequest.Type) throws -> TapMultiRequest {
        return self.readTapMultiRequest()
	}

    func readTapMultiRequest() -> TapMultiRequest {
        let model = TapMultiRequest()
        model.requests = self.readTapMultiRequestRequestItem()
        return model
    }

    
    func readTapMultiRequestRequestItem() -> TapMultiRequest.RequestItem {
        let model = TapMultiRequest.RequestItem()
        model.requestLen = self.readU2()
        model.request = self.readTapRequest()
        model.expectedCodeRet = self.readU1()
        return model
    }
    


	public func read(_ type: TapMultiResponse.Type) throws -> TapMultiResponse {
        return self.readTapMultiResponse()
	}

    func readTapMultiResponse() -> TapMultiResponse {
        let model = TapMultiResponse()
        model.responses = self.readTapMultiResponseResponseItem()
        return model
    }

    
    func readTapMultiResponseResponseItem() -> TapMultiResponse.ResponseItem {
        let model = TapMultiResponse.ResponseItem()
        model.responseLen = self.readU2()
        model.response = self.readTapResponse()
        return model
    }
    


	public func read(_ type: ApduResponse.Type) throws -> ApduResponse {
        return self.readApduResponse()
	}

    func readApduResponse() -> ApduResponse {
        let model = ApduResponse()
        model.data = self.readBytes(length: Int(self.getStreamSize() - 2))
        model.status = self.readBytes(length: Int(2))
        return model
    }

    


	public func read(_ type: ApduRequest.Type) throws -> ApduRequest {
        return self.readApduRequest()
	}

    func readApduRequest() -> ApduRequest {
        let model = ApduRequest()
        model.header = self.readApduRequestHeader()
        model.data = self.readBytes(length: Int(model.header.lc))
        return model
    }

    


	public func read(_ type: ApduRequestHeader.Type) throws -> ApduRequestHeader {
        return self.readApduRequestHeader()
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

    


	public func read(_ type: IotizeEncryptedFrame.Type) throws -> IotizeEncryptedFrame {
        return self.readIotizeEncryptedFrame()
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


    func write(_ model: TapRequestHeader) -> TapStreamWriter{
        return self.writeTapRequestHeader(model)
    }

    func writeTapRequestHeader(_ model: TapRequestHeader) -> TapStreamWriter{
        self.writeU1(model.methodType!.rawValue)
        self.writeTapRequestHeaderPath(model.path)
        return self
    }

    
    func write(_ model: TapRequestHeader.Path) -> TapStreamWriter{
        return self.writeTapRequestHeaderPath(model)
    }

    func writeTapRequestHeaderPath(_ model: TapRequestHeader.Path) -> TapStreamWriter{
        self.writeU2(model.objectId)
        self.writeU2(model.objectInstanceId)
        self.writeU2(model.resourceId)
        return self
    }
    



    func write(_ model: TapRequest) -> TapStreamWriter{
        return self.writeTapRequest(model)
    }

    func writeTapRequest(_ model: TapRequest) -> TapStreamWriter{
        self.writeTapRequestHeader(model.header)
        self.writeBytes(model.payload!)
        return self
    }

    



    func write(_ model: TapResponse) -> TapStreamWriter{
        return self.writeTapResponse(model)
    }

    func writeTapResponse(_ model: TapResponse) -> TapStreamWriter{
        self.writeU1(model.codeRet!)
        self.writeBytes(model.data!)
        return self
    }

    



    func write(_ model: TapApduRequest) -> TapStreamWriter{
        return self.writeTapApduRequest(model)
    }

    func writeTapApduRequest(_ model: TapApduRequest) -> TapStreamWriter{
        self.writeTapApduRequestHeader(model.header)
        self.writeTapRequest(model.request)
        return self
    }

    
    func write(_ model: TapApduRequest.Header) -> TapStreamWriter{
        return self.writeTapApduRequestHeader(model)
    }

    func writeTapApduRequestHeader(_ model: TapApduRequest.Header) -> TapStreamWriter{
        self.writeU1(model.cla!)
        self.writeU1(model.ins!)
        self.writeU1(model.p1!)
        self.writeU1(model.p2!)
        self.writeU1(model.lc!)
        return self
    }
    



    func write(_ model: TapMultiRequest) -> TapStreamWriter{
        return self.writeTapMultiRequest(model)
    }

    func writeTapMultiRequest(_ model: TapMultiRequest) -> TapStreamWriter{
        self.writeTapMultiRequestRequestItem(model.requests)
        return self
    }

    
    func write(_ model: TapMultiRequest.RequestItem) -> TapStreamWriter{
        return self.writeTapMultiRequestRequestItem(model)
    }

    func writeTapMultiRequestRequestItem(_ model: TapMultiRequest.RequestItem) -> TapStreamWriter{
        self.writeU2(model.requestLen!)
        self.writeTapRequest(model.request)
        self.writeU1(model.expectedCodeRet!)
        return self
    }
    



    func write(_ model: TapMultiResponse) -> TapStreamWriter{
        return self.writeTapMultiResponse(model)
    }

    func writeTapMultiResponse(_ model: TapMultiResponse) -> TapStreamWriter{
        self.writeTapMultiResponseResponseItem(model.responses)
        return self
    }

    
    func write(_ model: TapMultiResponse.ResponseItem) -> TapStreamWriter{
        return self.writeTapMultiResponseResponseItem(model)
    }

    func writeTapMultiResponseResponseItem(_ model: TapMultiResponse.ResponseItem) -> TapStreamWriter{
        self.writeU2(model.responseLen!)
        self.writeTapResponse(model.response)
        return self
    }
    



    func write(_ model: ApduResponse) -> TapStreamWriter{
        return self.writeApduResponse(model)
    }

    func writeApduResponse(_ model: ApduResponse) -> TapStreamWriter{
        self.writeBytes(model.data!)
        self.writeBytes(model.status!)
        return self
    }

    



    func write(_ model: ApduRequest) -> TapStreamWriter{
        return self.writeApduRequest(model)
    }

    func writeApduRequest(_ model: ApduRequest) -> TapStreamWriter{
        self.writeApduRequestHeader(model.header)
        self.writeBytes(model.data!)
        return self
    }

    



    func write(_ model: ApduRequestHeader) -> TapStreamWriter{
        return self.writeApduRequestHeader(model)
    }

    func writeApduRequestHeader(_ model: ApduRequestHeader) -> TapStreamWriter{
        self.writeU1(model.cla!)
        self.writeU1(model.ins!)
        self.writeU1(model.p1!)
        self.writeU1(model.p2!)
        self.writeU1(model.lc!)
        return self
    }

    



    func write(_ model: IotizeEncryptedFrame) -> TapStreamWriter{
        return self.writeIotizeEncryptedFrame(model)
    }

    func writeIotizeEncryptedFrame(_ model: IotizeEncryptedFrame) -> TapStreamWriter{
        self.writeU2(model.id!)
        self.writeU2(model.len!)
        self.writeBytes(model.payload!)
        self.writeU4(model.crc!)
        return self
    }

    


}
