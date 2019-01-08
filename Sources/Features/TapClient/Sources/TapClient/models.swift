/**
 * This file has been generated
 * DO NOT EDIT DIRECTLY, IT MAY BE OVERWRITE
 */

import TapClientApi



public class TapRequestHeader: Codable, TapCodable, Equatable {
    var methodType: MethodType!
    var path: Path!
    

    
    public init(){}
    

    


	public static func == (lhs: TapRequestHeader, rhs: TapRequestHeader) -> Bool {
        return true 
            && lhs.methodType == rhs.methodType
            && lhs.path == rhs.path
	}

    public init(methodType: MethodType, path: Path){
        self.methodType = methodType
        self.path = path
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    public class Path: Codable, TapCodable, Equatable {
        var objectId: UInt16 = 0xFFFF
        var objectInstanceId: UInt16 = 0xFFFF
        var resourceId: UInt16 = 0xFFFF
        


        
        public init(){}
        

        


        public static func == (lhs: Path, rhs: Path) -> Bool {
            return true 
                && lhs.objectId == rhs.objectId
                && lhs.objectInstanceId == rhs.objectInstanceId
                && lhs.resourceId == rhs.resourceId
        }


        public init(objectId: UInt16 = 0xFFFF, objectInstanceId: UInt16 = 0xFFFF, resourceId: UInt16 = 0xFFFF){
            self.objectId = objectId
            self.objectInstanceId = objectInstanceId
            self.resourceId = resourceId
            
        }

    }
    

    public enum MethodType: UInt8, Codable {
    case GET = 0x1
    case POST = 0x2
    case PUT = 0x3
    
}

    }



public class TapRequest: Codable, TapCodable, Equatable {
    var header: TapRequestHeader!
    var payload: Bytes!
    

    
    public init(){}
    

    


	public static func == (lhs: TapRequest, rhs: TapRequest) -> Bool {
        return true 
            && lhs.header == rhs.header
            && lhs.payload == rhs.payload
	}

    public init(header: TapRequestHeader, payload: Bytes){
        self.header = header
        self.payload = payload
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class TapResponse: Codable, TapCodable, Equatable {
    var codeRet: UInt8!
    var data: Bytes!
    

    
    public init(){}
    

    
public var description : String  {
    return "TapResponse[codeRet: \(self.codeRet)data: \(self.data?.hexstr)]"
}

/*
public var debugDescription : String  {
    return "TapResponse"
        + "; codeRet=" +  self.codeRet
        + "; data=" +  self.data?.hexstr
}
*/



	public static func == (lhs: TapResponse, rhs: TapResponse) -> Bool {
        return true 
            && lhs.codeRet == rhs.codeRet
            && lhs.data == rhs.data
	}

    public init(codeRet: UInt8, data: Bytes){
        self.codeRet = codeRet
        self.data = data
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class TapApduRequest: Codable, TapCodable, Equatable {
    var header: Header!
    var request: TapRequest!
    

    
    public init(){}
    

    
public var description : String  {
    return "TapApduRequest[header: \(self.header.description)request: \(self.request.description)]"
}

/*
public var debugDescription : String  {
    return "TapApduRequest"
        + "; header=" +  self.header.description
        + "; request=" +  self.request.description
}
*/



	public static func == (lhs: TapApduRequest, rhs: TapApduRequest) -> Bool {
        return true 
            && lhs.header == rhs.header
            && lhs.request == rhs.request
	}

    public init(header: Header, request: TapRequest){
        self.header = header
        self.request = request
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    public class Header: Codable, TapCodable, Equatable {
        var cla: UInt8!
        var ins: UInt8!
        var p1: UInt8!
        var p2: UInt8!
        var lc: UInt8!
        


        
        public init(){}
        

        
public var description : String  {
    return "Header[cla: \(self.cla)ins: \(self.ins)p1: \(self.p1)p2: \(self.p2)lc: \(self.lc)]"
}

/*
public var debugDescription : String  {
    return "Header"
        + "; cla=" +  self.cla
        + "; ins=" +  self.ins
        + "; p1=" +  self.p1
        + "; p2=" +  self.p2
        + "; lc=" +  self.lc
}
*/



        public static func == (lhs: Header, rhs: Header) -> Bool {
            return true 
                && lhs.cla == rhs.cla
                && lhs.ins == rhs.ins
                && lhs.p1 == rhs.p1
                && lhs.p2 == rhs.p2
                && lhs.lc == rhs.lc
        }


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



public class TapMultiRequest: Codable, TapCodable, Equatable {
    var requests: RequestItem!
    

    
    public init(){}
    

    
public var description : String  {
    return "TapMultiRequest[requests: \(self.requests.description)]"
}

/*
public var debugDescription : String  {
    return "TapMultiRequest"
        + "; requests=" +  self.requests.description
}
*/



	public static func == (lhs: TapMultiRequest, rhs: TapMultiRequest) -> Bool {
        return true 
            && lhs.requests == rhs.requests
	}

    public init(requests: RequestItem){
        self.requests = requests
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    public class RequestItem: Codable, TapCodable, Equatable {
        var requestLen: UInt16!
        var request: TapRequest!
        var expectedCodeRet: UInt8!
        


        
        public init(){}
        

        
public var description : String  {
    return "RequestItem[requestLen: \(self.requestLen)request: \(self.request.description)expectedCodeRet: \(self.expectedCodeRet)]"
}

/*
public var debugDescription : String  {
    return "RequestItem"
        + "; requestLen=" +  self.requestLen
        + "; request=" +  self.request.description
        + "; expectedCodeRet=" +  self.expectedCodeRet
}
*/



        public static func == (lhs: RequestItem, rhs: RequestItem) -> Bool {
            return true 
                && lhs.requestLen == rhs.requestLen
                && lhs.request == rhs.request
                && lhs.expectedCodeRet == rhs.expectedCodeRet
        }


        public init(requestLen: UInt16, request: TapRequest, expectedCodeRet: UInt8){
            self.requestLen = requestLen
            self.request = request
            self.expectedCodeRet = expectedCodeRet
            
        }

    }
    

    
    }



public class TapMultiResponse: Codable, TapCodable, Equatable {
    var responses: ResponseItem!
    

    
    public init(){}
    

    
public var description : String  {
    return "TapMultiResponse[responses: \(self.responses.description)]"
}

/*
public var debugDescription : String  {
    return "TapMultiResponse"
        + "; responses=" +  self.responses.description
}
*/



	public static func == (lhs: TapMultiResponse, rhs: TapMultiResponse) -> Bool {
        return true 
            && lhs.responses == rhs.responses
	}

    public init(responses: ResponseItem){
        self.responses = responses
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    public class ResponseItem: Codable, TapCodable, Equatable {
        var responseLen: UInt16!
        var response: TapResponse!
        


        
        public init(){}
        

        
public var description : String  {
    return "ResponseItem[responseLen: \(self.responseLen)response: \(self.response.description)]"
}

/*
public var debugDescription : String  {
    return "ResponseItem"
        + "; responseLen=" +  self.responseLen
        + "; response=" +  self.response.description
}
*/



        public static func == (lhs: ResponseItem, rhs: ResponseItem) -> Bool {
            return true 
                && lhs.responseLen == rhs.responseLen
                && lhs.response == rhs.response
        }


        public init(responseLen: UInt16, response: TapResponse){
            self.responseLen = responseLen
            self.response = response
            
        }

    }
    

    
    }



public class ApduResponse: Codable, TapCodable, Equatable {
    var data: Bytes!
    var status: UInt16!
    

    
    public init(){}
    

    
public var description : String  {
    return "ApduResponse[data: \(self.data?.hexstr)status: \(self.status)]"
}

/*
public var debugDescription : String  {
    return "ApduResponse"
        + "; data=" +  self.data?.hexstr
        + "; status=" +  self.status
}
*/



	public static func == (lhs: ApduResponse, rhs: ApduResponse) -> Bool {
        return true 
            && lhs.data == rhs.data
            && lhs.status == rhs.status
	}

    public init(data: Bytes, status: UInt16){
        self.data = data
        self.status = status
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class ApduRequest: Codable, TapCodable, Equatable {
    var header: ApduRequestHeader!
    var data: Bytes!
    

    
    public init(){}
    

    
public var description : String  {
    return "ApduRequest[header: \(self.header.description)data: \(self.data?.hexstr)]"
}

/*
public var debugDescription : String  {
    return "ApduRequest"
        + "; header=" +  self.header.description
        + "; data=" +  self.data?.hexstr
}
*/



	public static func == (lhs: ApduRequest, rhs: ApduRequest) -> Bool {
        return true 
            && lhs.header == rhs.header
            && lhs.data == rhs.data
	}

    public init(header: ApduRequestHeader, data: Bytes){
        self.header = header
        self.data = data
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class ApduRequestHeader: Codable, TapCodable, Equatable {
    var cla: UInt8!
    var ins: UInt8!
    var p1: UInt8!
    var p2: UInt8!
    var lc: UInt8!
    

    
    public init(){}
    

    
public var description : String  {
    return "ApduRequestHeader[cla: \(self.cla)ins: \(self.ins)p1: \(self.p1)p2: \(self.p2)lc: \(self.lc)]"
}

/*
public var debugDescription : String  {
    return "ApduRequestHeader"
        + "; cla=" +  self.cla
        + "; ins=" +  self.ins
        + "; p1=" +  self.p1
        + "; p2=" +  self.p2
        + "; lc=" +  self.lc
}
*/



	public static func == (lhs: ApduRequestHeader, rhs: ApduRequestHeader) -> Bool {
        return true 
            && lhs.cla == rhs.cla
            && lhs.ins == rhs.ins
            && lhs.p1 == rhs.p1
            && lhs.p2 == rhs.p2
            && lhs.lc == rhs.lc
	}

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



public class IotizeEncryptedFrame: Codable, TapCodable, Equatable {
    var id: UInt16!
    var len: UInt16!
    var payload: Bytes!
    var padding: Bytes!
    var crc: UInt32!
    

    
    public init(){}
    

    
public var description : String  {
    return "IotizeEncryptedFrame[id: \(self.id)len: \(self.len)payload: \(self.payload?.hexstr)padding: \(self.padding?.hexstr)crc: \(self.crc)]"
}

/*
public var debugDescription : String  {
    return "IotizeEncryptedFrame"
        + "; id=" +  self.id
        + "; len=" +  self.len
        + "; payload=" +  self.payload?.hexstr
        + "; padding=" +  self.padding?.hexstr
        + "; crc=" +  self.crc
}
*/



	public static func == (lhs: IotizeEncryptedFrame, rhs: IotizeEncryptedFrame) -> Bool {
        return true 
            && lhs.id == rhs.id
            && lhs.len == rhs.len
            && lhs.payload == rhs.payload
            && lhs.padding == rhs.padding
            && lhs.crc == rhs.crc
	}

    public init(id: UInt16, len: UInt16, payload: Bytes, padding: Bytes, crc: UInt32){
        self.id = id
        self.len = len
        self.payload = payload
        self.padding = padding
        self.crc = crc
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }




