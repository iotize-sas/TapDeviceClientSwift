

public class TapRequestHeader {
    var methodType: MethodType!
    var path: Path!
    

    public init(){
        
    
        
    
        
    }

    public class Path {
        var objectId: UInt16 = 0xFFFF
        var objectInstanceId: UInt16 = 0xFFFF
        var resourceId: UInt16 = 0xFFFF
        
    }
    

    public enum MethodType: UInt8, Codable {
    case GET = 0x1
    case PUT = 0x2
    case POST = 0x3
    
}

    }



public class TapRequest {
    var header: TapRequestHeader!
    var payload: Bytes!
    

    public init(){
        
    
        
    
        
    }

    

    
    }



public class TapResponse {
    var codeRet: UInt8!
    var data: Bytes!
    

    public init(){
        
    
        
    
        
    }

    

    
    }



public class TapApduRequest {
    var header: Header!
    var request: TapRequest!
    

    public init(){
        
    
        
    
        
    }

    public class Header {
        var cla: UInt8!
        var ins: UInt8!
        var p1: UInt8!
        var p2: UInt8!
        var lc: UInt8!
        
    }
    

    public enum MethodType: UInt8, Codable {
    case GET = 0xCA
    case PUT_OR_POST = 0xDA
    
}
public enum Default: UInt8, Codable {
    case CLA = 0xA2
    
}

    }



public class ApduResponse {
    var data: Bytes!
    var status: Bytes!
    

    public init(){
        
    
        
    
        
    }

    

    
    }



public class ApduRequest {
    var header: ApduRequestHeader!
    var data: Bytes!
    

    public init(){
        
    
        
    
        
    }

    

    
    }



public class ApduRequestHeader {
    var cla: UInt8!
    var ins: UInt8!
    var p1: UInt8!
    var p2: UInt8!
    var lc: UInt8!
    

    public init(){
        
    
        
    
        
    
        
    
        
    
        
    }

    

    
    }



public class IotizeEncryptedFrame {
    var id: UInt16!
    var len: UInt16!
    var payload: Bytes!
    var crc: UInt32!
    

    public init(){
        
    
        
    
        
    
        
    
        
    }

    

    
    }




