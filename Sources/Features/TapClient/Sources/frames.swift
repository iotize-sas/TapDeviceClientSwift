
extension KaitaiStreamReader {

    func readTapRequestHeader(): TapRequestHeader {
        var model = TapRequestHeader()
        model.methodType = readU1()
        model.path = readPath()
        return model
    }
    
    func readTapRequestHeaderPath(): TapRequestHeader.Path {
        var model = TapRequestHeader.Path()
        model.objectId = readU2()
        model.objectInstanceId = readU2()
        model.resourceId = readU2()
        return model
    }
    

    func readTapRequest(): TapRequest {
        var model = TapRequest()
        model.header = readTapRequestHeader()
        model.payload = readBytes()
        return model
    }
    

    func readTapApduRequest(): TapApduRequest {
        var model = TapApduRequest()
        model.header = readHeader()
        model.request = readTapRequest()
        return model
    }
    
    func readTapApduRequestHeader(): TapApduRequest.Header {
        var model = TapApduRequest.Header()
        model.cla = readU1()
        model.ins = readU1()
        model.p1 = readU1()
        model.p2 = readU1()
        model.lc = readU1()
        return model
    }
    

    func readApduResponse(): ApduResponse {
        var model = ApduResponse()
        model.data = readBytes(_io.size -2)
        model.status = readBytes(2)
        return model
    }
    

    func readIotizeEncryptedFrame(): IotizeEncryptedFrame {
        var model = IotizeEncryptedFrame()
        model.id = readU2()
        model.len = readU2()
        model.payload = readBytes(len)
        model.crc = readU4()
        return model
    }
    

    func readTapRequestHeader(): TapRequestHeader {
        var model = TapRequestHeader()
        model.methodType = readU1()
        model.path = readPath()
        return model
    }
    
    func readTapRequestHeaderPath(): TapRequestHeader.Path {
        var model = TapRequestHeader.Path()
        model.objectId = readU2()
        model.objectInstanceId = readU2()
        model.resourceId = readU2()
        return model
    }
    

    func readTapRequest(): TapRequest {
        var model = TapRequest()
        model.header = readTapRequestHeader()
        model.payload = readBytes()
        return model
    }
    

    func readTapApduRequest(): TapApduRequest {
        var model = TapApduRequest()
        model.header = readHeader()
        model.request = readTapRequest()
        return model
    }
    
    func readTapApduRequestHeader(): TapApduRequest.Header {
        var model = TapApduRequest.Header()
        model.cla = readU1()
        model.ins = readU1()
        model.p1 = readU1()
        model.p2 = readU1()
        model.lc = readU1()
        return model
    }
    

    func readApduResponse(): ApduResponse {
        var model = ApduResponse()
        model.data = readBytes(_io.size -2)
        model.status = readBytes(2)
        return model
    }
    

    func readIotizeEncryptedFrame(): IotizeEncryptedFrame {
        var model = IotizeEncryptedFrame()
        model.id = readU2()
        model.len = readU2()
        model.payload = readBytes(len)
        model.crc = readU4()
        return model
    }
    

}

extension KaitaiStreamWriter {

    func writeTapRequestHeader(model: tap_request_header){
        writeu1(model.methodType)
        writepath(model.path)
        return this
    }

    func writeTapRequest(model: tap_request){
        writetap_request_header(model.header)
        write(model.payload)
        return this
    }

    func writeTapApduRequest(model: tap_apdu_request){
        writeheader(model.header)
        writetap_request(model.request)
        return this
    }

    func writeApduResponse(model: apdu_response){
        write(model.data)
        write(model.status)
        return this
    }

    func writeIotizeEncryptedFrame(model: iotize_encrypted_frame){
        writeu2(model.id)
        writeu2(model.len)
        write(model.payload)
        writeu4(model.crc)
        return this
    }

    func writeTapRequestHeader(model: tap_request_header){
        writeu1(model.methodType)
        writepath(model.path)
        return this
    }

    func writeTapRequest(model: tap_request){
        writetap_request_header(model.header)
        write(model.payload)
        return this
    }

    func writeTapApduRequest(model: tap_apdu_request){
        writeheader(model.header)
        writetap_request(model.request)
        return this
    }

    func writeApduResponse(model: apdu_response){
        write(model.data)
        write(model.status)
        return this
    }

    func writeIotizeEncryptedFrame(model: iotize_encrypted_frame){
        writeu2(model.id)
        writeu2(model.len)
        write(model.payload)
        writeu4(model.crc)
        return this
    }

}
