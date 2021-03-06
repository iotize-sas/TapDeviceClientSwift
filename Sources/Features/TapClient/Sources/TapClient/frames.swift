/**
 * This file has been generated
 * DO NOT EDIT DIRECTLY, IT MAY BE OVERWRITE
 */

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
        model.status = self.readU2()
        return model
    }

    


	public func read(_ type: ApduRequest.Type) throws -> ApduRequest {
        return self.readApduRequest()
	}

    func readApduRequest() -> ApduRequest {
        let model = ApduRequest()
        model.header = self.readApduRequestHeader()
        model.data = self.readBytes(length: Int(Int(model.header.lc)))
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
        model.payload = self.readBytes(length: Int(Int(model.len)))
        model.padding = self.readBytes(length: Int((16 - ((2 + 2 + Int(model.len) + 4) % 16)) % 16))
        model.crc = self.readU4()
        return model
    }

    

}

public extension TapStreamWriter {


    func write(_ model: TapRequestHeader) -> TapStreamWriter{
        return self.writeTapRequestHeader(model)
    }

    func writeTapRequestHeader(_ model: TapRequestHeader) -> TapStreamWriter{
        _ = self.writeU1(model.methodType!.rawValue)
        _ = self.writeTapRequestHeaderPath(model.path)
        return self
    }

    
    func write(_ model: TapRequestHeader.Path) -> TapStreamWriter{
        return self.writeTapRequestHeaderPath(model)
    }

    func writeTapRequestHeaderPath(_ model: TapRequestHeader.Path) -> TapStreamWriter{
        _ = self.writeU2(model.objectId)
        _ = self.writeU2(model.objectInstanceId)
        _ = self.writeU2(model.resourceId)
        return self
    }
    



    func write(_ model: TapRequest) -> TapStreamWriter{
        return self.writeTapRequest(model)
    }

    func writeTapRequest(_ model: TapRequest) -> TapStreamWriter{
        _ = self.writeTapRequestHeader(model.header)
        _ = self.writeBytes(model.payload!)
        return self
    }

    



    func write(_ model: TapResponse) -> TapStreamWriter{
        return self.writeTapResponse(model)
    }

    func writeTapResponse(_ model: TapResponse) -> TapStreamWriter{
        _ = self.writeU1(model.codeRet!)
        _ = self.writeBytes(model.data!)
        return self
    }

    



    func write(_ model: TapApduRequest) -> TapStreamWriter{
        return self.writeTapApduRequest(model)
    }

    func writeTapApduRequest(_ model: TapApduRequest) -> TapStreamWriter{
        _ = self.writeTapApduRequestHeader(model.header)
        _ = self.writeTapRequest(model.request)
        return self
    }

    
    func write(_ model: TapApduRequest.Header) -> TapStreamWriter{
        return self.writeTapApduRequestHeader(model)
    }

    func writeTapApduRequestHeader(_ model: TapApduRequest.Header) -> TapStreamWriter{
        _ = self.writeU1(model.cla!)
        _ = self.writeU1(model.ins!)
        _ = self.writeU1(model.p1!)
        _ = self.writeU1(model.p2!)
        _ = self.writeU1(model.lc!)
        return self
    }
    



    func write(_ model: TapMultiRequest) -> TapStreamWriter{
        return self.writeTapMultiRequest(model)
    }

    func writeTapMultiRequest(_ model: TapMultiRequest) -> TapStreamWriter{
        _ = self.writeTapMultiRequestRequestItem(model.requests)
        return self
    }

    
    func write(_ model: TapMultiRequest.RequestItem) -> TapStreamWriter{
        return self.writeTapMultiRequestRequestItem(model)
    }

    func writeTapMultiRequestRequestItem(_ model: TapMultiRequest.RequestItem) -> TapStreamWriter{
        _ = self.writeU2(model.requestLen!)
        _ = self.writeTapRequest(model.request)
        _ = self.writeU1(model.expectedCodeRet!)
        return self
    }
    



    func write(_ model: TapMultiResponse) -> TapStreamWriter{
        return self.writeTapMultiResponse(model)
    }

    func writeTapMultiResponse(_ model: TapMultiResponse) -> TapStreamWriter{
        _ = self.writeTapMultiResponseResponseItem(model.responses)
        return self
    }

    
    func write(_ model: TapMultiResponse.ResponseItem) -> TapStreamWriter{
        return self.writeTapMultiResponseResponseItem(model)
    }

    func writeTapMultiResponseResponseItem(_ model: TapMultiResponse.ResponseItem) -> TapStreamWriter{
        _ = self.writeU2(model.responseLen!)
        _ = self.writeTapResponse(model.response)
        return self
    }
    



    func write(_ model: ApduResponse) -> TapStreamWriter{
        return self.writeApduResponse(model)
    }

    func writeApduResponse(_ model: ApduResponse) -> TapStreamWriter{
        _ = self.writeBytes(model.data!)
        _ = self.writeU2(model.status!)
        return self
    }

    



    func write(_ model: ApduRequest) -> TapStreamWriter{
        return self.writeApduRequest(model)
    }

    func writeApduRequest(_ model: ApduRequest) -> TapStreamWriter{
        _ = self.writeApduRequestHeader(model.header)
        _ = self.writeBytes(model.data!)
        return self
    }

    



    func write(_ model: ApduRequestHeader) -> TapStreamWriter{
        return self.writeApduRequestHeader(model)
    }

    func writeApduRequestHeader(_ model: ApduRequestHeader) -> TapStreamWriter{
        _ = self.writeU1(model.cla!)
        _ = self.writeU1(model.ins!)
        _ = self.writeU1(model.p1!)
        _ = self.writeU1(model.p2!)
        _ = self.writeU1(model.lc!)
        return self
    }

    



    func write(_ model: IotizeEncryptedFrame) -> TapStreamWriter{
        return self.writeIotizeEncryptedFrame(model)
    }

    func writeIotizeEncryptedFrame(_ model: IotizeEncryptedFrame) -> TapStreamWriter{
        _ = self.writeU2(model.id!)
        _ = self.writeU2(model.len!)
        _ = self.writeBytes(model.payload!)
        _ = self.writeBytes(model.padding!)
        _ = self.appendCRC()
        return self
    }

    


}
