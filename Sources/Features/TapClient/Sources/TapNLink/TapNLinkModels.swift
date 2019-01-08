/**
 * This file has been generated
 * DO NOT EDIT DIRECTLY, IT MAY BE OVERWRITE
 */

import TapClientApi



public class Types: Codable, TapCodable, Equatable {
    

    

    
public var description : String  {
    return "Types[]"
}

/*
public var debugDescription : String  {
    return "Types"
}
*/



	public static func == (lhs: Types, rhs: Types) -> Bool {
        return true 
	}

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



public class AclEntry: Codable, TapCodable, Equatable {
    // unamed

    var create: Bool!
    var delete: Bool!
    var execute: Bool!
    var write: Bool!
    var read: Bool!
    

    
    public init(){}
    

    
public var description : String  {
    return "AclEntry[create: \(self.create)delete: \(self.delete)execute: \(self.execute)write: \(self.write)read: \(self.read)]"
}

/*
public var debugDescription : String  {
    return "AclEntry"
        + "; create=" +  self.create
        + "; delete=" +  self.delete
        + "; execute=" +  self.execute
        + "; write=" +  self.write
        + "; read=" +  self.read
}
*/



	public static func == (lhs: AclEntry, rhs: AclEntry) -> Bool {
        return true 
            && lhs.create == rhs.create
            && lhs.delete == rhs.delete
            && lhs.execute == rhs.execute
            && lhs.write == rhs.write
            && lhs.read == rhs.read
	}

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



public class MemoryInfo: Codable, TapCodable, Equatable {
    var address: UInt32!
    var wordCount: UInt32!
    var wordSize: WordSizeType!
    

    
    public init(){}
    

    
public var description : String  {
    return "MemoryInfo[address: \(self.address)wordCount: \(self.wordCount)wordSize: \(self.wordSize.rawValue)]"
}

/*
public var debugDescription : String  {
    return "MemoryInfo"
        + "; address=" +  self.address
        + "; wordCount=" +  self.wordCount
        + "; wordSize=" +  self.wordSize.rawValue
}
*/



	public static func == (lhs: MemoryInfo, rhs: MemoryInfo) -> Bool {
        return true 
            && lhs.address == rhs.address
            && lhs.wordCount == rhs.wordCount
            && lhs.wordSize == rhs.wordSize
	}

    public init(address: UInt32, wordCount: UInt32, wordSize: WordSizeType){
        self.address = address
        self.wordCount = wordCount
        self.wordSize = wordSize
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    public enum WordSizeType: UInt8, Codable {
    case _32_BITS = 3
    case _16_BITS = 2
    case _8_BITS = 1
    case _1_BIT = 0
    
}

    }



public class MemoryWriteInfo: Codable, TapCodable, Equatable {
    var address: MemoryInfo!
    var value: Bytes!
    

    
    public init(){}
    

    
public var description : String  {
    return "MemoryWriteInfo[address: \(self.address.description)value: \(self.value?.hexstr)]"
}

/*
public var debugDescription : String  {
    return "MemoryWriteInfo"
        + "; address=" +  self.address.description
        + "; value=" +  self.value?.hexstr
}
*/



	public static func == (lhs: MemoryWriteInfo, rhs: MemoryWriteInfo) -> Bool {
        return true 
            && lhs.address == rhs.address
            && lhs.value == rhs.value
	}

    public init(address: MemoryInfo, value: Bytes){
        self.address = address
        self.value = value
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class ReadWriteRights: Codable, TapCodable, Equatable {
    // unamed

    var write: Bool!
    var read: Bool!
    

    
    public init(){}
    

    
public var description : String  {
    return "ReadWriteRights[write: \(self.write)read: \(self.read)]"
}

/*
public var debugDescription : String  {
    return "ReadWriteRights"
        + "; write=" +  self.write
        + "; read=" +  self.read
}
*/



	public static func == (lhs: ReadWriteRights, rhs: ReadWriteRights) -> Bool {
        return true 
            && lhs.write == rhs.write
            && lhs.read == rhs.read
	}

    public init(write: Bool, read: Bool){
        
        self.write = write
        self.read = read
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class DatalogOption: Codable, TapCodable, Equatable {
    // unamed

    var security: Bool!
    var qos: Bool!
    // unamed

    var logOnChange: Bool!
    var rollingMode: Bool!
    var autorun: Bool!
    

    
    public init(){}
    

    
public var description : String  {
    return "DatalogOption[security: \(self.security)qos: \(self.qos)logOnChange: \(self.logOnChange)rollingMode: \(self.rollingMode)autorun: \(self.autorun)]"
}

/*
public var debugDescription : String  {
    return "DatalogOption"
        + "; security=" +  self.security
        + "; qos=" +  self.qos
        + "; logOnChange=" +  self.logOnChange
        + "; rollingMode=" +  self.rollingMode
        + "; autorun=" +  self.autorun
}
*/



	public static func == (lhs: DatalogOption, rhs: DatalogOption) -> Bool {
        return true 
            && lhs.security == rhs.security
            && lhs.qos == rhs.qos
            && lhs.logOnChange == rhs.logOnChange
            && lhs.rollingMode == rhs.rollingMode
            && lhs.autorun == rhs.autorun
	}

    public init(security: Bool, qos: Bool, logOnChange: Bool, rollingMode: Bool, autorun: Bool){
        
        self.security = security
        self.qos = qos
        
        self.logOnChange = logOnChange
        self.rollingMode = rollingMode
        self.autorun = autorun
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class UartSettings: Codable, TapCodable, Equatable {
    var ctr2: Ctr2!
    var ctr1: Ctr1!
    

    
    public init(){}
    

    
public var description : String  {
    return "UartSettings[ctr2: \(self.ctr2.description)ctr1: \(self.ctr1.description)]"
}

/*
public var debugDescription : String  {
    return "UartSettings"
        + "; ctr2=" +  self.ctr2.description
        + "; ctr1=" +  self.ctr1.description
}
*/



	public static func == (lhs: UartSettings, rhs: UartSettings) -> Bool {
        return true 
            && lhs.ctr2 == rhs.ctr2
            && lhs.ctr1 == rhs.ctr1
	}

    public init(ctr2: Ctr2, ctr1: Ctr1){
        self.ctr2 = ctr2
        self.ctr1 = ctr1
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    public class Ctr1: Codable, TapCodable, Equatable {
        // unamed

        var physicalPort: PhysicalPort!
        var stopBit: StopBit!
        var parity: BitParity!
        var dataLength: UInt8!
        var handshakeDelimiter: HandshakeDelimiter!
        var handshakeValue: Handshake!
        var timeout: UInt8!
        


        
        public init(){}
        

        
public var description : String  {
    return "Ctr1[physicalPort: \(self.physicalPort.rawValue)stopBit: \(self.stopBit.rawValue)parity: \(self.parity.rawValue)dataLength: \(self.dataLength)handshakeDelimiter: \(self.handshakeDelimiter.rawValue)handshakeValue: \(self.handshakeValue.rawValue)timeout: \(self.timeout)]"
}

/*
public var debugDescription : String  {
    return "Ctr1"
        + "; physicalPort=" +  self.physicalPort.rawValue
        + "; stopBit=" +  self.stopBit.rawValue
        + "; parity=" +  self.parity.rawValue
        + "; dataLength=" +  self.dataLength
        + "; handshakeDelimiter=" +  self.handshakeDelimiter.rawValue
        + "; handshakeValue=" +  self.handshakeValue.rawValue
        + "; timeout=" +  self.timeout
}
*/



        public static func == (lhs: Ctr1, rhs: Ctr1) -> Bool {
            return true 
                && lhs.physicalPort == rhs.physicalPort
                && lhs.stopBit == rhs.stopBit
                && lhs.parity == rhs.parity
                && lhs.dataLength == rhs.dataLength
                && lhs.handshakeDelimiter == rhs.handshakeDelimiter
                && lhs.handshakeValue == rhs.handshakeValue
                && lhs.timeout == rhs.timeout
        }


        public init(physicalPort: PhysicalPort, stopBit: StopBit, parity: BitParity, dataLength: UInt8, handshakeDelimiter: HandshakeDelimiter, handshakeValue: Handshake, timeout: UInt8){
            
            self.physicalPort = physicalPort
            self.stopBit = stopBit
            self.parity = parity
            self.dataLength = dataLength
            self.handshakeDelimiter = handshakeDelimiter
            self.handshakeValue = handshakeValue
            self.timeout = timeout
            
        }

    }
    public class Ctr2: Codable, TapCodable, Equatable {
        var slv: UInt8!
        // unamed

        var ofs: Bool!
        var baudrate: Int!
        


        
        public init(){}
        

        
public var description : String  {
    return "Ctr2[slv: \(self.slv)ofs: \(self.ofs)baudrate: \(self.baudrate)]"
}

/*
public var debugDescription : String  {
    return "Ctr2"
        + "; slv=" +  self.slv
        + "; ofs=" +  self.ofs
        + "; baudrate=" +  self.baudrate
}
*/



        public static func == (lhs: Ctr2, rhs: Ctr2) -> Bool {
            return true 
                && lhs.slv == rhs.slv
                && lhs.ofs == rhs.ofs
                && lhs.baudrate == rhs.baudrate
        }


        public init(slv: UInt8, ofs: Bool, baudrate: Int){
            self.slv = slv
            
            self.ofs = ofs
            self.baudrate = baudrate
            
        }

    }
    

    public enum BitParity: UInt8, Codable {
    case NONE = 0
    case ODD = 1
    case EVEN = 2
    
}
public enum Handshake: UInt8, Codable {
    case NONE = 0
    case RTS = 1
    case CTS = 2
    case RTS_CTS = 3
    
}
public enum StopBit: UInt8, Codable {
    case ONE = 0
    case ONE_AND_HALF = 1
    case TWO = 2
    
}
public enum PhysicalPort: UInt8, Codable {
    case NONE = 0
    case RS232 = 1
    case RS485_NO_TERM = 2
    case USB = 3
    case AUTO = 6
    case RS485_TERM = 10
    
}
public enum HandshakeDelimiter: UInt8, Codable {
    case NONE = 0x0
    case CR = 0x1
    case LF = 0x2
    case CR_LF = 0x3
    
}

    }



public class TapVersion: Codable, TapCodable, Equatable {
    var major: UInt8!
    var minor: UInt8!
    var build: UInt16!
    

    
    public init(){}
    

    


	public static func == (lhs: TapVersion, rhs: TapVersion) -> Bool {
        return true 
            && lhs.major == rhs.major
            && lhs.minor == rhs.minor
            && lhs.build == rhs.build
	}

    public init(major: UInt8, minor: UInt8, build: UInt16){
        self.major = major
        self.minor = minor
        self.build = build
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class Lwm2mTlv: Codable, TapCodable, Equatable {
    var identifierType: UInt8!
    var identifierLength: Bool!
    var lengthType: UInt8!
    var other: UInt8!
    var identifier: Bytes!
    var len: UInt16!
    var value: Bytes!
    

    
    public init(){}
    

    
public var description : String  {
    return "Lwm2mTlv[identifierType: \(self.identifierType)identifierLength: \(self.identifierLength)lengthType: \(self.lengthType)other: \(self.other)identifier: \(self.identifier?.hexstr)len: \(self.len)value: \(self.value?.hexstr)]"
}

/*
public var debugDescription : String  {
    return "Lwm2mTlv"
        + "; identifierType=" +  self.identifierType
        + "; identifierLength=" +  self.identifierLength
        + "; lengthType=" +  self.lengthType
        + "; other=" +  self.other
        + "; identifier=" +  self.identifier?.hexstr
        + "; len=" +  self.len
        + "; value=" +  self.value?.hexstr
}
*/



	public static func == (lhs: Lwm2mTlv, rhs: Lwm2mTlv) -> Bool {
        return true 
            && lhs.identifierType == rhs.identifierType
            && lhs.identifierLength == rhs.identifierLength
            && lhs.lengthType == rhs.lengthType
            && lhs.other == rhs.other
            && lhs.identifier == rhs.identifier
            && lhs.len == rhs.len
            && lhs.value == rhs.value
	}

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



public class InterfaceLock: Codable, TapCodable, Equatable {
    // unamed

    // unamed

    var scramActivated: Bool!
    var hashPassword: Bool!
    var factoryReset: Bool!
    var resourceLogUid: Bool!
    var resouceFactory: Bool!
    

    
    public init(){}
    

    
public var description : String  {
    return "InterfaceLock[scramActivated: \(self.scramActivated)hashPassword: \(self.hashPassword)factoryReset: \(self.factoryReset)resourceLogUid: \(self.resourceLogUid)resouceFactory: \(self.resouceFactory)]"
}

/*
public var debugDescription : String  {
    return "InterfaceLock"
        + "; scramActivated=" +  self.scramActivated
        + "; hashPassword=" +  self.hashPassword
        + "; factoryReset=" +  self.factoryReset
        + "; resourceLogUid=" +  self.resourceLogUid
        + "; resouceFactory=" +  self.resouceFactory
}
*/



	public static func == (lhs: InterfaceLock, rhs: InterfaceLock) -> Bool {
        return true 
            && lhs.scramActivated == rhs.scramActivated
            && lhs.hashPassword == rhs.hashPassword
            && lhs.factoryReset == rhs.factoryReset
            && lhs.resourceLogUid == rhs.resourceLogUid
            && lhs.resouceFactory == rhs.resouceFactory
	}

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



public class LoginCredential: Codable, TapCodable, Equatable {
    var username: String!
    var password: String!
    

    
    public init(){}
    

    
public var description : String  {
    return "LoginCredential[username: \(self.username)password: \(self.password)]"
}

/*
public var debugDescription : String  {
    return "LoginCredential"
        + "; username=" +  self.username
        + "; password=" +  self.password
}
*/



	public static func == (lhs: LoginCredential, rhs: LoginCredential) -> Bool {
        return true 
            && lhs.username == rhs.username
            && lhs.password == rhs.password
	}

    public init(username: String, password: String){
        self.username = username
        self.password = password
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class LoginCredentialHashed: Codable, TapCodable, Equatable {
    var username: String!
    var password: Bytes!
    

    
    public init(){}
    

    
public var description : String  {
    return "LoginCredentialHashed[username: \(self.username)password: \(self.password?.hexstr)]"
}

/*
public var debugDescription : String  {
    return "LoginCredentialHashed"
        + "; username=" +  self.username
        + "; password=" +  self.password?.hexstr
}
*/



	public static func == (lhs: LoginCredentialHashed, rhs: LoginCredentialHashed) -> Bool {
        return true 
            && lhs.username == rhs.username
            && lhs.password == rhs.password
	}

    public init(username: String, password: Bytes){
        self.username = username
        self.password = password
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class ScramLoginParams: Codable, TapCodable, Equatable {
    var username: String!
    var clientNonce: UInt32!
    

    
    public init(){}
    

    
public var description : String  {
    return "ScramLoginParams[username: \(self.username)clientNonce: \(self.clientNonce)]"
}

/*
public var debugDescription : String  {
    return "ScramLoginParams"
        + "; username=" +  self.username
        + "; clientNonce=" +  self.clientNonce
}
*/



	public static func == (lhs: ScramLoginParams, rhs: ScramLoginParams) -> Bool {
        return true 
            && lhs.username == rhs.username
            && lhs.clientNonce == rhs.clientNonce
	}

    public init(username: String, clientNonce: UInt32){
        self.username = username
        self.clientNonce = clientNonce
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class ScramLoginResponseBody: Codable, TapCodable, Equatable {
    var serverNonce: UInt32!
    var salt: Bytes!
    var iterationNumber: UInt32!
    

    
    public init(){}
    

    
public var description : String  {
    return "ScramLoginResponseBody[serverNonce: \(self.serverNonce)salt: \(self.salt?.hexstr)iterationNumber: \(self.iterationNumber)]"
}

/*
public var debugDescription : String  {
    return "ScramLoginResponseBody"
        + "; serverNonce=" +  self.serverNonce
        + "; salt=" +  self.salt?.hexstr
        + "; iterationNumber=" +  self.iterationNumber
}
*/



	public static func == (lhs: ScramLoginResponseBody, rhs: ScramLoginResponseBody) -> Bool {
        return true 
            && lhs.serverNonce == rhs.serverNonce
            && lhs.salt == rhs.salt
            && lhs.iterationNumber == rhs.iterationNumber
	}

    public init(serverNonce: UInt32, salt: Bytes, iterationNumber: UInt32){
        self.serverNonce = serverNonce
        self.salt = salt
        self.iterationNumber = iterationNumber
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class TargetComStats: Codable, TapCodable, Equatable {
    var nbFailCom: UInt32!
    var nbSuccessfulCom: UInt32!
    

    
    public init(){}
    

    
public var description : String  {
    return "TargetComStats[nbFailCom: \(self.nbFailCom)nbSuccessfulCom: \(self.nbSuccessfulCom)]"
}

/*
public var debugDescription : String  {
    return "TargetComStats"
        + "; nbFailCom=" +  self.nbFailCom
        + "; nbSuccessfulCom=" +  self.nbSuccessfulCom
}
*/



	public static func == (lhs: TargetComStats, rhs: TargetComStats) -> Bool {
        return true 
            && lhs.nbFailCom == rhs.nbFailCom
            && lhs.nbSuccessfulCom == rhs.nbSuccessfulCom
	}

    public init(nbFailCom: UInt32, nbSuccessfulCom: UInt32){
        self.nbFailCom = nbFailCom
        self.nbSuccessfulCom = nbSuccessfulCom
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class AvailableFunction: Codable, TapCodable, Equatable {
    // unamed

    var debug: Bool!
    var datalog: Bool!
    

    
    public init(){}
    

    
public var description : String  {
    return "AvailableFunction[debug: \(self.debug)datalog: \(self.datalog)]"
}

/*
public var debugDescription : String  {
    return "AvailableFunction"
        + "; debug=" +  self.debug
        + "; datalog=" +  self.datalog
}
*/



	public static func == (lhs: AvailableFunction, rhs: AvailableFunction) -> Bool {
        return true 
            && lhs.debug == rhs.debug
            && lhs.datalog == rhs.datalog
	}

    public init(debug: Bool, datalog: Bool){
        
        self.debug = debug
        self.datalog = datalog
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class CrcCheckBody: Codable, TapCodable, Equatable {
    var address: UInt32!
    var size: UInt32!
    var crc: UInt32!
    

    
    public init(){}
    

    
public var description : String  {
    return "CrcCheckBody[address: \(self.address)size: \(self.size)crc: \(self.crc)]"
}

/*
public var debugDescription : String  {
    return "CrcCheckBody"
        + "; address=" +  self.address
        + "; size=" +  self.size
        + "; crc=" +  self.crc
}
*/



	public static func == (lhs: CrcCheckBody, rhs: CrcCheckBody) -> Bool {
        return true 
            && lhs.address == rhs.address
            && lhs.size == rhs.size
            && lhs.crc == rhs.crc
	}

    public init(address: UInt32, size: UInt32, crc: UInt32){
        self.address = address
        self.size = size
        self.crc = crc
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    
    }



public class SinglePacket: Codable, TapCodable, Equatable {
    var sendTime: UInt32!
    var packetLength: UInt16!
    var packetId: UInt16!
    var configVersion: UInt32!
    var messageType: PacketType!
    // unamed

    var encryption: Bool!
    var ack: Bool!
    var senderId: UInt8!
    var salt: UInt16!
    var logTime: UInt32!
    var dataSize: UInt16!
    var data: Bytes!
    var padding: Bytes!
    var crc: UInt32!
    

    
    public init(){}
    

    
public var description : String  {
    return "SinglePacket[sendTime: \(self.sendTime)packetLength: \(self.packetLength)packetId: \(self.packetId)configVersion: \(self.configVersion)messageType: \(self.messageType.rawValue)encryption: \(self.encryption)ack: \(self.ack)senderId: \(self.senderId)salt: \(self.salt)logTime: \(self.logTime)dataSize: \(self.dataSize)data: \(self.data?.hexstr)padding: \(self.padding?.hexstr)crc: \(self.crc)]"
}

/*
public var debugDescription : String  {
    return "SinglePacket"
        + "; sendTime=" +  self.sendTime
        + "; packetLength=" +  self.packetLength
        + "; packetId=" +  self.packetId
        + "; configVersion=" +  self.configVersion
        + "; messageType=" +  self.messageType.rawValue
        + "; encryption=" +  self.encryption
        + "; ack=" +  self.ack
        + "; senderId=" +  self.senderId
        + "; salt=" +  self.salt
        + "; logTime=" +  self.logTime
        + "; dataSize=" +  self.dataSize
        + "; data=" +  self.data?.hexstr
        + "; padding=" +  self.padding?.hexstr
        + "; crc=" +  self.crc
}
*/



	public static func == (lhs: SinglePacket, rhs: SinglePacket) -> Bool {
        return true 
            && lhs.sendTime == rhs.sendTime
            && lhs.packetLength == rhs.packetLength
            && lhs.packetId == rhs.packetId
            && lhs.configVersion == rhs.configVersion
            && lhs.messageType == rhs.messageType
            && lhs.encryption == rhs.encryption
            && lhs.ack == rhs.ack
            && lhs.senderId == rhs.senderId
            && lhs.salt == rhs.salt
            && lhs.logTime == rhs.logTime
            && lhs.dataSize == rhs.dataSize
            && lhs.data == rhs.data
            && lhs.padding == rhs.padding
            && lhs.crc == rhs.crc
	}

    public init(sendTime: UInt32, packetLength: UInt16, packetId: UInt16, configVersion: UInt32, messageType: PacketType, encryption: Bool, ack: Bool, senderId: UInt8, salt: UInt16, logTime: UInt32, dataSize: UInt16, data: Bytes, padding: Bytes, crc: UInt32){
        self.sendTime = sendTime
        self.packetLength = packetLength
        self.packetId = packetId
        self.configVersion = configVersion
        self.messageType = messageType
        
        self.encryption = encryption
        self.ack = ack
        self.senderId = senderId
        self.salt = salt
        self.logTime = logTime
        self.dataSize = dataSize
        self.data = data
        self.padding = padding
        self.crc = crc
        
    }

    // public var description: String {
//     return "TODO: \(val)"

// }


    

    public enum PacketType: UInt8, Codable {
    case MASK = 0x7
    case DATALOG = 0x1
    case COMMAND = 0x2
    case CODE_EXEC = 0x3
    case CONF_UPDATE = 0x4
    case SECURITY_TOKEN = 0x5
    case TARGET_FW_UPDATE = 0x6
    
}

    }




