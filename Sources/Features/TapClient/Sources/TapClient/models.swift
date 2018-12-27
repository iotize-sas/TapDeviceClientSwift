import TapClientApi



public class TapRequestHeader: Codable, TapCodable {
    var methodType: MethodType!
    var path: Path!
    

    
    public init(){}
    

    public init(methodType: MethodType, path: Path){
        self.methodType = methodType
        self.path = path
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    public class Path: Codable, TapCodable {
        var objectId: UInt16 = 0xFFFF
        var objectInstanceId: UInt16 = 0xFFFF
        var resourceId: UInt16 = 0xFFFF
        


        
        public init(){}
        

        public init(objectId: UInt16 = 0xFFFF, objectInstanceId: UInt16 = 0xFFFF, resourceId: UInt16 = 0xFFFF){
            self.objectId = objectId
            self.objectInstanceId = objectInstanceId
            self.resourceId = resourceId
            
        }

    }
    

    public enum MethodType: UInt8, Codable {
    case GET = 0x1
    case PUT = 0x2
    case POST = 0x3
    
}

    }



public class TapRequest: Codable, TapCodable {
    var header: TapRequestHeader!
    var payload: Bytes!
    

    
    public init(){}
    

    public init(header: TapRequestHeader, payload: Bytes){
        self.header = header
        self.payload = payload
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class TapResponse: Codable, TapCodable {
    var codeRet: UInt8!
    var data: Bytes!
    

    
    public init(){}
    

    public init(codeRet: UInt8, data: Bytes){
        self.codeRet = codeRet
        self.data = data
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class TapApduRequest: Codable, TapCodable {
    var header: Header!
    var request: TapRequest!
    

    
    public init(){}
    

    public init(header: Header, request: TapRequest){
        self.header = header
        self.request = request
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    public class Header: Codable, TapCodable {
        var cla: UInt8!
        var ins: UInt8!
        var p1: UInt8!
        var p2: UInt8!
        var lc: UInt8!
        


        
        public init(){}
        

        public init(cla: UInt8, ins: UInt8, p1: UInt8, p2: UInt8, lc: UInt8){
            self.cla = cla
            self.ins = ins
            self.p1 = p1
            self.p2 = p2
            self.lc = lc
            
        }

    }
    

    public enum MethodType: UInt8, Codable {
    case GET = 0xCA
    case PUT_OR_POST = 0xDA
    
}
public enum Default: UInt8, Codable {
    case CLA = 0xA2
    
}

    }



public class TapMultiRequest: Codable, TapCodable {
    var requests: RequestItem!
    

    
    public init(){}
    

    public init(requests: RequestItem){
        self.requests = requests
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    public class RequestItem: Codable, TapCodable {
        var requestLen: UInt16!
        var request: TapRequest!
        var expectedCodeRet: UInt8!
        


        
        public init(){}
        

        public init(requestLen: UInt16, request: TapRequest, expectedCodeRet: UInt8){
            self.requestLen = requestLen
            self.request = request
            self.expectedCodeRet = expectedCodeRet
            
        }

    }
    

    
    }



public class TapMultiResponse: Codable, TapCodable {
    var responses: ResponseItem!
    

    
    public init(){}
    

    public init(responses: ResponseItem){
        self.responses = responses
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    public class ResponseItem: Codable, TapCodable {
        var responseLen: UInt16!
        var response: TapResponse!
        


        
        public init(){}
        

        public init(responseLen: UInt16, response: TapResponse){
            self.responseLen = responseLen
            self.response = response
            
        }

    }
    

    
    }



public class ApduResponse: Codable, TapCodable {
    var data: Bytes!
    var status: Bytes!
    

    
    public init(){}
    

    public init(data: Bytes, status: Bytes){
        self.data = data
        self.status = status
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class ApduRequest: Codable, TapCodable {
    var header: ApduRequestHeader!
    var data: Bytes!
    

    
    public init(){}
    

    public init(header: ApduRequestHeader, data: Bytes){
        self.header = header
        self.data = data
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class ApduRequestHeader: Codable, TapCodable {
    var cla: UInt8!
    var ins: UInt8!
    var p1: UInt8!
    var p2: UInt8!
    var lc: UInt8!
    

    
    public init(){}
    

    public init(cla: UInt8, ins: UInt8, p1: UInt8, p2: UInt8, lc: UInt8){
        self.cla = cla
        self.ins = ins
        self.p1 = p1
        self.p2 = p2
        self.lc = lc
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class IotizeEncryptedFrame: Codable, TapCodable {
    var id: UInt16!
    var len: UInt16!
    var payload: Bytes!
    var crc: UInt32!
    

    
    public init(){}
    

    public init(id: UInt16, len: UInt16, payload: Bytes, crc: UInt32){
        self.id = id
        self.len = len
        self.payload = payload
        self.crc = crc
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }




