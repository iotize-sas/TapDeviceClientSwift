

class TapRequestHeader {
    var methodType: Int?
    var path: Path?
    

    class Path {
        var objectId: UInt8 = 0xFFFF
        
        var objectInstanceId: UInt16 = 0xFFFF
        
        var resourceId: UInt16 = 0xFFFF
        
        
    }
    

    enum MethodType: Int, Codable {
        case GET = 0x1
        case PUT = 0x2
        case POST = 0x3
        
    }
    
}



class TapRequest {
    var header: TapRequestHeader!
    var payload: [UInt8]!
    

    

    
}



class TapApduRequest {
    var header: Header
    var request: TapRequest
    

    class Header {
        var cla: Int
        
        var ins: Int
        
        var p1: Int
        
        var p2: Int
        
        var lc: Int
        
        
    }
    

    enum MethodType: Int, Codable {
        case GET = 0xCA
        case PUT_OR_POST = 0xDA
        
    }
    enum Default: Int, Codable {
        case CLA = 0xA2
        
    }
    
}



class ApduResponse {
    var data: [Uint8]
    var status: [Uint8]
    

    

    
}



class IotizeEncryptedFrame {
    var id: Int
    var len: Int
    var payload: [Uint8]
    var crc: Int
    

    

    
}


class TapRequest {
    var header: TapRequestHeader
    var payload: [Uint8]
    

    

    
}



class TapApduRequest {
    var header: Header
    var request: TapRequest
    

    class Header {
        var cla: Int
        
        var ins: Int
        
        var p1: Int
        
        var p2: Int
        
        var lc: Int
        
        
    }
    

    enum MethodType: Int, Codable {
        case GET = 0xCA
        case PUT_OR_POST = 0xDA
        
    }
    enum Default: Int, Codable {
        case CLA = 0xA2
        
    }
    
}



class ApduResponse {
    var data: [Uint8]
    var status: [Uint8]
    

    

    
}



class IotizeEncryptedFrame {
    var id: Int
    var len: Int
    var payload: [Uint8]
    var crc: Int
    

    

    
}




