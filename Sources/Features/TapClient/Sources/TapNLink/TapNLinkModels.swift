

public class Types {
    

    public init(){
        
    }

    

    }

public enum AvailablePowerSource: UInt8, Codable {
    case DC_POWER = 0b00000001
    case S3P = 0b00010000
    case AC_EXTERNAL_POWER = 0b00100000
    
}
public enum FirmwareState: UInt8, Codable {
    case NORMAL = 0b00000001
    case UPDATING = 0b00000010
    case UPDATED = 0b00000100
    
}
public enum FirmwareUpdateResult: UInt8, Codable {
    case DEFAULT_VALUE = 0b00000000
    case UPDATE_SUCCESSFUL = 0b00000001
    case NOT_ENOUGH_MEMORY = 0b00000010
    case OUT_OF_MEMORY = 0b00000100
    case CONNECTION_LOST = 0b00001000
    case CRC_CHECK_FAILURE = 0b00010000
    case UNSUPPORTED_PACKAGE_TYPE = 0b00100000
    case INVALID_URI = 0b01000000
    
}
public enum HostProtocol: UInt8, Codable {
    case NFC = 0b00000001
    case BLUETOOTH = 0b00000010
    case GSM = 0b00000100
    case USB_RLINK = 0b00001000
    case USB_CMISIS_DAP = 0b00010000
    case WIFI = 0b00100000
    case BLE = 0b01000000
    
}
public enum ListTargetProtocol: UInt8, Codable {
    case SWD = 0b00000001
    case S3P = 0b00000010
    case JTAG = 0b00000100
    case MODBUS = 0b00001000
    case GPIO = 0b00010000
    case SERIAL_STANDARD = 0b00100000
    case SERIAL_STANDARD_SWD = 0b01000000
    case SERIAL_STANDARD_S3P = 0b10000000
    
}
public enum ListHostProtocol: UInt8, Codable {
    case NFC = 0b00000001
    case BLUETOOTH = 0b00000010
    case GSM = 0b00000100
    case USB_RLINK = 0b00001000
    case USB_CMISIS_DAP = 0b00010000
    case WIFI = 0b00100000
    case BLE = 0b01000000
    
}
public enum LowPowerOptimisationLevel: UInt8, Codable {
    case NO = 0x0
    case STANDBY = 0x2
    case SHUTDOWN = 0x3
    
}
public enum NetworkMode: UInt8, Codable {
    case PEER_TO_PEER = 0b0
    case INFRASTRUCTURE_ONLY = 0b1
    case INFRASTRUCTURE_CLOUD = 0b10
    
}
public enum CloudConnectionMode: UInt8, Codable {
    case GENERIC = 0x0
    case IBM_BLUEMIX = 0x1
    case MICROSOFT_AZURE = 0x2
    case AMAZON_AWS = 0x4
    
}
public enum TargetProtocol: UInt8, Codable {
    case SWD = 0x0
    case S3P = 0x1
    case JTAG = 0x2
    case MODBUS = 0x3
    case GPIO = 0x4
    case SERIAL_STANDARD = 0x5
    case SERIAL_STANDARD_SWD = 0x6
    case SERIAL_STANDARD_S3P = 0x7
    
}
public enum Coretype: UInt8, Codable {
    case M0_CORTEX = 0b00000001
    case M3_CORTEX = 0b00000010
    
}
public enum NfcPairingMode: UInt8, Codable {
    case NO = 0x0
    case MANDATORY = 0x1
    case MANDATORY_FOR_LOGIN = 0x2
    
}
public enum TargetCoreType: UInt8, Codable {
    case M0_CORTEX = 0x0
    case M1_CORTEX = 0x1
    
}



public class AclEntry {
    // unamed

    var create: Int!
    var delete: Int!
    var execute: Int!
    var write: Int!
    var read: Int!
    

    public init(){
        // unamed

        
    
        
    
        
    
        
    
        
    
        
    }

    

    
    }



public class MemoryInfo {
    var address: UInt32!
    var length: UInt32!
    var sizeInBytes: UInt32!
    

    public init(){
        
    
        
    
        
    
        
    }

    

    
    }



public class MemoryWriteInfo {
    var address: UInt32!
    var length: UInt32!
    var itemSize: UInt8!
    var value: Bytes!
    

    public init(){
        
    
        
    
        
    
        
    
        
    }

    

    
    }



public class ReadWriteRights {
    // unamed

    var write: Int!
    var read: Int!
    

    public init(){
        // unamed

        
    
        
    
        
    }

    

    
    }



public class DatalogOption {
    // unamed

    var security: Int!
    var qos: Int!
    // unamed

    var logOnChange: Int!
    var rollingMode: Int!
    var autoorun: Int!
    

    public init(){
        // unamed

        
    
        
    
        // unamed

        
    
        
    
        
    
        
    }

    

    
    }



public class UartSettings {
    var ctr2: Ctr2!
    var ctr1: Ctr1!
    

    public init(){
        
    
        
    
        
    }

    public class Ctr1 {
        var skip: Int!
        var physicalPort: PhysicalPort!
        var stopBit: StopBit!
        var parity: BitParity!
        var dataLength: Int!
        var handshakeDelimiter: HandshakeDelimiter!
        var handshakeValue: Int!
        var timeout: UInt8!
        
    }
    public class Ctr2 {
        var slv: UInt8!
        var skip: Int!
        var ofs: Int!
        var baudrate: Int!
        
    }
    

    public enum BitParity: UInt8, Codable {
    case NONE = 0
    case ODD = 1
    case EVEN = 2
    
}
public enum StopBit: UInt8, Codable {
    case ONE = 0
    case ONE_AND_HALF = 1
    case TWO = 2
    
}
public enum PhysicalPort: UInt8, Codable {
    case RS232 = 1
    case RS485 = 2
    case USB = 3
    case UART = 4
    case CAN = 5
    case TERMINAISON_ACTIVE = 6
    case NONE = 0
    
}
public enum HandshakeDelimiter: UInt8, Codable {
    case NONE = 0x0
    case CR = 0x1
    case LF = 0x2
    case CR_LF = 0x3
    
}

    }



public class Lwm2mTlv {
    var identifierType: Int!
    var identifierLength: Int!
    var lengthType: Int!
    var other: Int!
    var identifier: Bytes!
    var len: UInt16!
    var value: Bytes!
    

    public init(){
        
    
        
    
        
    
        
    
        
    
        
    
        
    
        
    }

    

    
    }




public class InterfaceLock {
    // unamed

    // unamed

    var scramActivated: Int!
    var hashPassword: Int!
    var factoryReset: Int!
    var resourceLogUid: Int!
    var resouceFactory: Int!
    

    public init(){
        // unamed

        // unamed

        
    
        
    
        
    
        
    
        
    
        
    }

    

    
    }



public class ScramLoginParams {
    var username: String!
    var clientNonce: UInt32!
    

    public init(){
        
    
        
    
        
    }

    

    
    }



public class ScramLoginResponseBody {
    var servernonce: UInt32!
    var salt: Bytes!
    var iterationNumber: UInt32!
    

    public init(){
        
    
        
    
        
    
        
    }

    

    
    }




