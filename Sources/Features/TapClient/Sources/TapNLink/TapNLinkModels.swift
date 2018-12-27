import TapClientApi



public class Types: Codable, TapCodable {
    

    

    public init(){
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

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



public class AclEntry: Codable, TapCodable {
    // unamed

    var create: Bool!
    var delete: Bool!
    var execute: Bool!
    var write: Bool!
    var read: Bool!
    

    
    public init(){}
    

    public init(create: Bool, delete: Bool, execute: Bool, write: Bool, read: Bool){
        
        self.create = create
        self.delete = delete
        self.execute = execute
        self.write = write
        self.read = read
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class MemoryInfo: Codable, TapCodable {
    var address: UInt32!
    var length: UInt32!
    var sizeInBytes: UInt32!
    

    
    public init(){}
    

    public init(address: UInt32, length: UInt32, sizeInBytes: UInt32){
        self.address = address
        self.length = length
        self.sizeInBytes = sizeInBytes
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class MemoryWriteInfo: Codable, TapCodable {
    var address: UInt32!
    var length: UInt32!
    var itemSize: UInt8!
    var value: Bytes!
    

    
    public init(){}
    

    public init(address: UInt32, length: UInt32, itemSize: UInt8, value: Bytes){
        self.address = address
        self.length = length
        self.itemSize = itemSize
        self.value = value
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class ReadWriteRights: Codable, TapCodable {
    // unamed

    var write: Bool!
    var read: Bool!
    

    
    public init(){}
    

    public init(write: Bool, read: Bool){
        
        self.write = write
        self.read = read
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class DatalogOption: Codable, TapCodable {
    // unamed

    var security: Bool!
    var qos: Bool!
    // unamed

    var logOnChange: Bool!
    var rollingMode: Bool!
    var autoorun: Bool!
    

    
    public init(){}
    

    public init(security: Bool, qos: Bool, logOnChange: Bool, rollingMode: Bool, autoorun: Bool){
        
        self.security = security
        self.qos = qos
        
        self.logOnChange = logOnChange
        self.rollingMode = rollingMode
        self.autoorun = autoorun
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class UartSettings: Codable, TapCodable {
    var ctr2: Ctr2!
    var ctr1: Ctr1!
    

    
    public init(){}
    

    public init(ctr2: Ctr2, ctr1: Ctr1){
        self.ctr2 = ctr2
        self.ctr1 = ctr1
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    public class Ctr1: Codable, TapCodable {
        var skip: UInt8!
        var physicalPort: PhysicalPort!
        var stopBit: StopBit!
        var parity: BitParity!
        var dataLength: UInt8!
        var handshakeDelimiter: HandshakeDelimiter!
        var handshakeValue: UInt8!
        var timeout: UInt8!
        


        
        public init(){}
        

        public init(skip: UInt8, physicalPort: PhysicalPort, stopBit: StopBit, parity: BitParity, dataLength: UInt8, handshakeDelimiter: HandshakeDelimiter, handshakeValue: UInt8, timeout: UInt8){
            self.skip = skip
            self.physicalPort = physicalPort
            self.stopBit = stopBit
            self.parity = parity
            self.dataLength = dataLength
            self.handshakeDelimiter = handshakeDelimiter
            self.handshakeValue = handshakeValue
            self.timeout = timeout
            
        }

    }
    public class Ctr2: Codable, TapCodable {
        var slv: UInt8!
        var skip: UInt8!
        var ofs: Bool!
        var baudrate: Int!
        


        
        public init(){}
        

        public init(slv: UInt8, skip: UInt8, ofs: Bool, baudrate: Int){
            self.slv = slv
            self.skip = skip
            self.ofs = ofs
            self.baudrate = baudrate
            
        }

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



public class Lwm2mTlv: Codable, TapCodable {
    var identifierType: UInt8!
    var identifierLength: Bool!
    var lengthType: UInt8!
    var other: UInt8!
    var identifier: Bytes!
    var len: UInt16!
    var value: Bytes!
    

    
    public init(){}
    

    public init(identifierType: UInt8, identifierLength: Bool, lengthType: UInt8, other: UInt8, identifier: Bytes, len: UInt16, value: Bytes){
        self.identifierType = identifierType
        self.identifierLength = identifierLength
        self.lengthType = lengthType
        self.other = other
        self.identifier = identifier
        self.len = len
        self.value = value
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class InterfaceLock: Codable, TapCodable {
    // unamed

    // unamed

    var scramActivated: Bool!
    var hashPassword: Bool!
    var factoryReset: Bool!
    var resourceLogUid: Bool!
    var resouceFactory: Bool!
    

    
    public init(){}
    

    public init(scramActivated: Bool, hashPassword: Bool, factoryReset: Bool, resourceLogUid: Bool, resouceFactory: Bool){
        
        
        self.scramActivated = scramActivated
        self.hashPassword = hashPassword
        self.factoryReset = factoryReset
        self.resourceLogUid = resourceLogUid
        self.resouceFactory = resouceFactory
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class LoginCredential: Codable, TapCodable {
    var username: String!
    var password: String!
    

    
    public init(){}
    

    public init(username: String, password: String){
        self.username = username
        self.password = password
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class ScramLoginParams: Codable, TapCodable {
    var username: String!
    var clientNonce: UInt32!
    

    
    public init(){}
    

    public init(username: String, clientNonce: UInt32){
        self.username = username
        self.clientNonce = clientNonce
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class ScramLoginResponseBody: Codable, TapCodable {
    var servernonce: UInt32!
    var salt: Bytes!
    var iterationNumber: UInt32!
    

    
    public init(){}
    

    public init(servernonce: UInt32, salt: Bytes, iterationNumber: UInt32){
        self.servernonce = servernonce
        self.salt = salt
        self.iterationNumber = iterationNumber
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class TargetComStats: Codable, TapCodable {
    var nbFailCom: UInt32!
    var nbSuccessfulCom: UInt32!
    

    
    public init(){}
    

    public init(nbFailCom: UInt32, nbSuccessfulCom: UInt32){
        self.nbFailCom = nbFailCom
        self.nbSuccessfulCom = nbSuccessfulCom
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class AvailableFunction: Codable, TapCodable {
    // unamed

    var debug: Bool!
    var datalog: Bool!
    

    
    public init(){}
    

    public init(debug: Bool, datalog: Bool){
        
        self.debug = debug
        self.datalog = datalog
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class CrcCheckBody: Codable, TapCodable {
    var address: UInt32!
    var size: UInt32!
    var crc: UInt32!
    

    
    public init(){}
    

    public init(address: UInt32, size: UInt32, crc: UInt32){
        self.address = address
        self.size = size
        self.crc = crc
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }




