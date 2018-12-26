// This file has been generated
// Do not edit this file, it may be overwritten
//



class Types {
    

    

    enum AvailablePowerSource: Int, Codable {
        case DC_POWER = 0b00000001
        case S3P = 0b00010000
        case AC_EXTERNAL_POWER = 0b00100000
        
    }
    enum FirmwareState: Int, Codable {
        case NORMAL = 0b00000001
        case UPDATING = 0b00000010
        case UPDATED = 0b00000100
        
    }
    enum FirmwareUpdateResult: Int, Codable {
        case DEFAULT_VALUE = 0b00000000
        case UPDATE_SUCCESSFUL = 0b00000001
        case NOT_ENOUGH_MEMORY = 0b00000010
        case OUT_OF_MEMORY = 0b00000100
        case CONNECTION_LOST = 0b00001000
        case CRC_CHECK_FAILURE = 0b00010000
        case UNSUPPORTED_PACKAGE_TYPE = 0b00100000
        case INVALID_URI = 0b01000000
        
    }
    enum HostProtocol: Int, Codable {
        case NFC = 0b00000001
        case BLUETOOTH = 0b00000010
        case GSM = 0b00000100
        case USB_RLINK = 0b00001000
        case USB_CMISIS_DAP = 0b00010000
        case WIFI = 0b00100000
        case BLE = 0b01000000
        
    }
    enum ListTargetProtocol: Int, Codable {
        case SWD = 0b00000001
        case S3P = 0b00000010
        case JTAG = 0b00000100
        case MODBUS = 0b00001000
        case GPIO = 0b00010000
        case SERIAL_STANDARD = 0b00100000
        case SERIAL_STANDARD_SWD = 0b01000000
        case SERIAL_STANDARD_S3P = 0b10000000
        
    }
    enum ListHostProtocol: Int, Codable {
        case NFC = 0b00000001
        case BLUETOOTH = 0b00000010
        case GSM = 0b00000100
        case USB_RLINK = 0b00001000
        case USB_CMISIS_DAP = 0b00010000
        case WIFI = 0b00100000
        case BLE = 0b01000000
        
    }
    enum LowPowerOptimisationLevel: Int, Codable {
        case NO = 0x0
        case STANDBY = 0x2
        case SHUTDOWN = 0x3
        
    }
    enum NetworkMode: Int, Codable {
        case PEER_TO_PEER = 0b0
        case INFRASTRUCTURE_ONLY = 0b1
        case INFRASTRUCTURE_CLOUD = 0b10
        
    }
    enum CloudConnectionMode: Int, Codable {
        case GENERIC = 0x0
        case IBM_BLUEMIX = 0x1
        case MICROSOFT_AZURE = 0x2
        case AMAZON_AWS = 0x4
        
    }
    enum TargetProtocol: Int, Codable {
        case SWD = 0x0
        case S3P = 0x1
        case JTAG = 0x2
        case MODBUS = 0x3
        case GPIO = 0x4
        case SERIAL_STANDARD = 0x5
        case SERIAL_STANDARD_SWD = 0x6
        case SERIAL_STANDARD_S3P = 0x7
        
    }
    enum Coretype: Int, Codable {
        case M0_CORTEX = 0b00000001
        case M3_CORTEX = 0b00000010
        
    }
    enum NfcPairingMode: Int, Codable {
        case NO = 0x0
        case MANDATORY = 0x1
        case MANDATORY_FOR_LOGIN = 0x2
        
    }
    enum TargetCoreType: Int, Codable {
        case M0_CORTEX = 0x0
        case M1_CORTEX = 0x1
        
    }
    
}



class AclEntry {
    // unamed

    var create: Bool!
    var delete: Bool!
    var execute: Bool!
    var write: Bool!
    var read: Bool!
    

    

    
}



class MemoryInfo {
    var address: UInt32!
    var length: UInt32!
    var sizeInBytes: UInt32!
    

    

    
}



class MemoryWriteInfo {
    var address: UInt32!
    var length: UInt32!
    var itemSize: UInt8!
    var value: Bytes!
    

    

    
}



class DatalogOption {
    // unamed

    var security: Bool!
    var qos: Bool!
    // unamed

    var logOnChange: Bool!
    var rollingMode: Bool!
    var autoorun: Bool!
    

    

    
}



class UartSettings {
    var ctr2: Ctr2!
    var ctr1: Ctr1!
    

    class Ctr1 {
        var skip: B4!
        var physicalPort: B4!
        var stopBit: B2!
        var parity: B4!
        var dataLength: B2!
        var handshakeDelimiter: B4!
        var handshakeValue: B4!
        var timeout: UInt8!
        
    }
    class Ctr2 {
        var slv: UInt8!
        var skip: B3!
        var ofs: Bool!
        var baudrate: B20!
        
    }
    

    enum BitParity: Int, Codable {
        case NONE = 0
        case ODD = 1
        case EVEN = 2
        
    }
    enum StopBit: Int, Codable {
        case ONE = 0
        case ONE_AND_HALF = 1
        case TWO = 2
        
    }
    enum PhysicalPort: Int, Codable {
        case RS232 = 1
        case RS485 = 2
        case USB = 3
        case UART = 4
        case CAN = 5
        case TERMINAISON_ACTIVE = 6
        case NONE = 0
        
    }
    enum HandshakeDelimiter: Int, Codable {
        case NONE = 0x0
        case CR = 0x1
        case LF = 0x2
        case CR_LF = 0x3
        
    }
    
}



class Lwm2mTlv {
    var identifierType: B2!
    var identifierLength: Bool!
    var lengthType: B2!
    var other: B3!
    var identifier: Bytes!
    var len: UInt16!
    var value: Bytes!
    

    

    
}



class DatalogOption {
    // unamed

    var security: Bool!
    var qos: Bool!
    // unamed

    var logOnChange: Bool!
    var rollingMode: Bool!
    var autoorun: Bool!
    

    

    
}



class AclEntry {
    // unamed

    var create: Bool!
    var delete: Bool!
    var execute: Bool!
    var write: Bool!
    var read: Bool!
    

    

    
}



class InterfaceLock {
    // unamed

    // unamed

    var scramActivated: Bool!
    var hashPassword: Bool!
    var factoryReset: Bool!
    var resourceLogUid: Bool!
    var resouceFactory: Bool!
    

    

    
}



class ScramLoginParams {
    var username: String!
    var clientNonce: UInt32!
    

    

    
}



class ScramLoginResponseBody {
    var servernonce: UInt32!
    var salt: Bytes!
    var iterationNumber: UInt32!
    

    

    
}




