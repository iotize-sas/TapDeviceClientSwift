
public struct TapResultCode {


   /**
    * Internal server error
    * Hex: 0xA0 UInt: 0xA0 Int: 0xA0
    * 
    */
    public static let INTERNAL_SERVER_ERROR: UInt8 = 0xA0;

   /**
    * Non volatile memory is full
    * Hex: 0xA7 UInt: 0xA7 Int: 0xA7
    * 
    */
    public static let NVM_FULL: UInt8 = 0xA7;

   /**
    * Target power failure
    * Hex: 0xA6 UInt: 0xA6 Int: 0xA6
    * 
    */
    public static let TARGET_POWER_FAILURE: UInt8 = 0xA6;

   /**
    * Tap was not able to connect to the target
    * Hex: 0xA5 UInt: 0xA5 Int: 0xA5
    * 
    */
    public static let UNABLE_TO_CONNECT_TO_TARGET: UInt8 = 0xA5;

   /**
    * Writing non volatible memory failed
    * Hex: 0xA4 UInt: 0xA4 Int: 0xA4
    * 
    */
    public static let NVM_ERROR: UInt8 = 0xA4;

   /**
    * Service unavailable
    * Hex: 0xA3 UInt: 0xA3 Int: 0xA3
    * 
    */
    public static let SERVICE_UNAVAILABLE: UInt8 = 0xA3;

   /**
    * This resource has not been implemented yet
    * Hex: 0xA1 UInt: 0xA1 Int: 0xA1
    * 
    */
    public static let NOT_IMPLEMENTED: UInt8 = 0xA1;

   /**
    * 
    * Hex: 0xBA UInt: 0xBA Int: 0xBA
    * 
    */
    public static let TARGET_PROTOCOL_ABORT: UInt8 = 0xBA;

   /**
    * DELETED
    * Hex: 0x42 UInt: 0x42 Int: 0x42
    * 
    */
    public static let DELETED: UInt8 = 0x42;

   /**
    * Given parameters are not acceptable
    * Hex: 0x86 UInt: 0x86 Int: 0x86
    * 
    */
    public static let NOT_ACCEPTABLE: UInt8 = 0x86;

   /**
    * CREATED
    * Hex: 0x41 UInt: 0x41 Int: 0x41
    * 
    */
    public static let CREATED: UInt8 = 0x41;

   /**
    * Current user is not authorized to access this ressource
    * Hex: 0x85 UInt: 0x85 Int: 0x85
    * @deprecated
    */
    public static let METHOD_NOT_ALLOWED: UInt8 = 0x85;

   /**
    * The server has not found anything matching the Request
    * Hex: 0x84 UInt: 0x84 Int: 0x84
    * 
    */
    public static let NOT_FOUND: UInt8 = 0x84;

   /**
    * Current user is not authorized to access this ressource
    * Hex: 0x81 UInt: 0x81 Int: 0x81
    * 
    */
    public static let UNAUTHORIZED: UInt8 = 0x81;

   /**
    * Bad request. Meaning device cannot understand your request.
    * Hex: 0x80 UInt: 0x80 Int: 0x80
    * 
    */
    public static let BAD_REQUEST: UInt8 = 0x80;

   /**
    * The server is busy
    * Hex: 0x46 UInt: 0x46 Int: 0x46
    * 
    */
    public static let BUSY: UInt8 = 0x46;

   /**
    * The server has fulfilled the request and sent a response
    * Hex: 0x45 UInt: 0x45 Int: 0x45
    * 
    */
    public static let CONTENT: UInt8 = 0x45;

   /**
    * CHANGED
    * Hex: 0x44 UInt: 0x44 Int: 0x44
    * 
    */
    public static let CHANGED: UInt8 = 0x44;

   /**
    * 
    * Hex: 0xBB UInt: 0xBB Int: 0xBB
    * 
    */
    public static let TARGET_PROTOCOL_NOT_IMPLEMENTED: UInt8 = 0xBB;

   /**
    * 
    * Hex: 0xB1 UInt: 0xB1 Int: 0xB1
    * 
    */
    public static let TARGET_PROTOCOL_BUSY: UInt8 = 0xB1;

   /**
    * 
    * Hex: 0xB0 UInt: 0xB0 Int: 0xB0
    * 
    */
    public static let TARGET_PROTOCOL_ERROR: UInt8 = 0xB0;

   /**
    * The request is OK
    * Hex: 0x0 UInt: 0x0 Int: 0x0
    * 
    */
    public static let NO_ERROR: UInt8 = 0x0;

   /**
    * 
    * Hex: 0xB9 UInt: 0xB9 Int: 0xB9
    * 
    */
    public static let TARGET_PROTOCOL_INT: UInt8 = 0xB9;

   /**
    * Pending
    * Hex: 0x1 UInt: 0x1 Int: 0x1
    * 
    */
    public static let PENDING: UInt8 = 0x1;

   /**
    * 
    * Hex: 0xB8 UInt: 0xB8 Int: 0xB8
    * 
    */
    public static let TARGET_PROTOCOL_PARAM: UInt8 = 0xB8;

   /**
    * Pas de com 
    * Hex: 0xB7 UInt: 0xB7 Int: 0xB7
    * 
    */
    public static let TARGET_PROTOCOL_LOST_COM: UInt8 = 0xB7;

   /**
    * Com mais pas bonne. Erreur de parité 
    * Hex: 0xB6 UInt: 0xB6 Int: 0xB6
    * 
    */
    public static let TARGET_PROTOCOL_COM: UInt8 = 0xB6;

   /**
    * 
    * Hex: 0xB5 UInt: 0xB5 Int: 0xB5
    * 
    */
    public static let TARGET_PROTOCOL_DATA: UInt8 = 0xB5;

   /**
    * 
    * Hex: 0xB4 UInt: 0xB4 Int: 0xB4
    * 
    */
    public static let TARGET_PROTOCOL_FORBIDDEN: UInt8 = 0xB4;

   /**
    * Target protocol parameters are not valid
    * Hex: 0xB3 UInt: 0xB3 Int: 0xB3
    * 
    */
    public static let TARGET_PROTOCOL_WRONG_PARAM: UInt8 = 0xB3;

   /**
    * 
    * Hex: 0xB2 UInt: 0xB2 Int: 0xB2
    * 
    */
    public static let TARGET_PROTOCOL_REAL: UInt8 = 0xB2;

	public static func description(code: UInt8) -> String {
        switch code {
            case 0xA0: return "Internal server error"
            case 0xA7: return "Non volatile memory is full"
            case 0xA6: return "Target power failure"
            case 0xA5: return "Tap was not able to connect to the target"
            case 0xA4: return "Writing non volatible memory failed"
            case 0xA3: return "Service unavailable"
            case 0xA1: return "This resource has not been implemented yet"
            case 0xBA: return "TARGET_PROTOCOL_ABORT"
            case 0x42: return "DELETED"
            case 0x86: return "Given parameters are not acceptable"
            case 0x41: return "CREATED"
            case 0x85: return "Current user is not authorized to access this ressource"
            case 0x84: return "The server has not found anything matching the Request"
            case 0x81: return "Current user is not authorized to access this ressource"
            case 0x80: return "Bad request. Meaning device cannot understand your request."
            case 0x46: return "The server is busy"
            case 0x45: return "The server has fulfilled the request and sent a response"
            case 0x44: return "CHANGED"
            case 0xBB: return "TARGET_PROTOCOL_NOT_IMPLEMENTED"
            case 0xB1: return "TARGET_PROTOCOL_BUSY"
            case 0xB0: return "TARGET_PROTOCOL_ERROR"
            case 0x0: return "The request is OK"
            case 0xB9: return "TARGET_PROTOCOL_INT"
            case 0x1: return "Pending"
            case 0xB8: return "TARGET_PROTOCOL_PARAM"
            case 0xB7: return "Pas de com "
            case 0xB6: return "Com mais pas bonne. Erreur de parité "
            case 0xB5: return "TARGET_PROTOCOL_DATA"
            case 0xB4: return "TARGET_PROTOCOL_FORBIDDEN"
            case 0xB3: return "Target protocol parameters are not valid"
            case 0xB2: return "TARGET_PROTOCOL_REAL"
            default: return "Unknown error code \(code)"
		}
	}


    public static func errorName(code: UInt8) -> String {
        switch code {
                case 0xA0: return "INTERNAL_SERVER_ERROR"
                case 0xA7: return "NVM_FULL"
                case 0xA6: return "TARGET_POWER_FAILURE"
                case 0xA5: return "UNABLE_TO_CONNECT_TO_TARGET"
                case 0xA4: return "NVM_ERROR"
                case 0xA3: return "SERVICE_UNAVAILABLE"
                case 0xA1: return "NOT_IMPLEMENTED"
                case 0xBA: return "TARGET_PROTOCOL_ABORT"
                case 0x42: return "DELETED"
                case 0x86: return "NOT_ACCEPTABLE"
                case 0x41: return "CREATED"
                case 0x85: return "METHOD_NOT_ALLOWED"
                case 0x84: return "NOT_FOUND"
                case 0x81: return "UNAUTHORIZED"
                case 0x80: return "BAD_REQUEST"
                case 0x46: return "BUSY"
                case 0x45: return "CONTENT"
                case 0x44: return "CHANGED"
                case 0xBB: return "TARGET_PROTOCOL_NOT_IMPLEMENTED"
                case 0xB1: return "TARGET_PROTOCOL_BUSY"
                case 0xB0: return "TARGET_PROTOCOL_ERROR"
                case 0x0: return "NO_ERROR"
                case 0xB9: return "TARGET_PROTOCOL_INT"
                case 0x1: return "PENDING"
                case 0xB8: return "TARGET_PROTOCOL_PARAM"
                case 0xB7: return "TARGET_PROTOCOL_LOST_COM"
                case 0xB6: return "TARGET_PROTOCOL_COM"
                case 0xB5: return "TARGET_PROTOCOL_DATA"
                case 0xB4: return "TARGET_PROTOCOL_FORBIDDEN"
                case 0xB3: return "TARGET_PROTOCOL_WRONG_PARAM"
                case 0xB2: return "TARGET_PROTOCOL_REAL"
        default: return "UNKNOWN"
        }
    }

}