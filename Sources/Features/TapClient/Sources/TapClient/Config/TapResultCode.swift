
public struct TapResultCode {


   /**
    * Internal server error
    * Hex: 0xA0 UInt: 0xA0 Int: 0xA0
    */
    public static let IOTIZE_500_INTERNAL_SERVER_ERROR: UInt8 = 0xA0;

   /**
    * 
    * Hex: 0xA7 UInt: 0xA7 Int: 0xA7
    */
    public static let IOTIZE_507_NVM_FUL: UInt8 = 0xA7;

   /**
    * 
    * Hex: 0xA6 UInt: 0xA6 Int: 0xA6
    */
    public static let IOTIZE_506_TARGET_POWER_FAILURE: UInt8 = 0xA6;

   /**
    * 
    * Hex: 0xA5 UInt: 0xA5 Int: 0xA5
    */
    public static let IOTIZE_505_UNABLE_TO_CONNECT_TO_TARGET: UInt8 = 0xA5;

   /**
    * 
    * Hex: 0xA4 UInt: 0xA4 Int: 0xA4
    */
    public static let IOTIZE_504_NVM_ERROR: UInt8 = 0xA4;

   /**
    * Service unavailable
    * Hex: 0xA3 UInt: 0xA3 Int: 0xA3
    */
    public static let IOTIZE_503_SERVICE_UNAVAILABLE: UInt8 = 0xA3;

   /**
    * This resource has not been implemented yet
    * Hex: 0xA1 UInt: 0xA1 Int: 0xA1
    */
    public static let IOTIZE_501_NOT_IMPLEMENTED: UInt8 = 0xA1;

   /**
    * 
    * Hex: 0xBA UInt: 0xBA Int: 0xBA
    */
    public static let IOTIZE_TARGET_PROTOCOL_ABORT: UInt8 = 0xBA;

   /**
    * DELETED
    * Hex: 0x42 UInt: 0x42 Int: 0x42
    */
    public static let IOTIZE_202_DELETED: UInt8 = 0x42;

   /**
    * 
    * Hex: 0x86 UInt: 0x86 Int: 0x86
    */
    public static let IOTIZE_406_NOT_ACCEPTABLE: UInt8 = 0x86;

   /**
    * CREATED
    * Hex: 0x41 UInt: 0x41 Int: 0x41
    */
    public static let IOTIZE_201_CREATED: UInt8 = 0x41;

   /**
    * 
    * Hex: 0x85 UInt: 0x85 Int: 0x85
    */
    public static let IOTIZE_405_METHOD_NOT_ALLOWED: UInt8 = 0x85;

   /**
    * The server has not found anything matching the Request
    * Hex: 0x84 UInt: 0x84 Int: 0x84
    */
    public static let IOTIZE_404_NOT_FOUND: UInt8 = 0x84;

   /**
    * 
    * Hex: 0x81 UInt: 0x81 Int: 0x81
    */
    public static let IOTIZE_401_UNAUTHORIZED: UInt8 = 0x81;

   /**
    * BAD_REQUEST
    * Hex: 0x80 UInt: 0x80 Int: 0x80
    */
    public static let IOTIZE_400_BAD_REQUEST: UInt8 = 0x80;

   /**
    * The server is busy
    * Hex: 0x46 UInt: 0x46 Int: 0x46
    */
    public static let IOTIZE_206_BUSY: UInt8 = 0x46;

   /**
    * The server has fulfilled the request and sent a response
    * Hex: 0x45 UInt: 0x45 Int: 0x45
    */
    public static let IOTIZE_205_CONTENT: UInt8 = 0x45;

   /**
    * CHANGED
    * Hex: 0x44 UInt: 0x44 Int: 0x44
    */
    public static let IOTIZE_204_CHANGED: UInt8 = 0x44;

   /**
    * 
    * Hex: 0xBB UInt: 0xBB Int: 0xBB
    */
    public static let IOTIZE_TARGET_PROTOCOL_NOT_IMPLEMENTED: UInt8 = 0xBB;

   /**
    * 
    * Hex: 0xB1 UInt: 0xB1 Int: 0xB1
    */
    public static let IOTIZE_TARGET_PROTOCOL_BUSY: UInt8 = 0xB1;

   /**
    * 
    * Hex: 0xB0 UInt: 0xB0 Int: 0xB0
    */
    public static let IOTIZE_TARGET_PROTOCOL_ERROR: UInt8 = 0xB0;

   /**
    * NO_ERROR
    * Hex: 0x0 UInt: 0x0 Int: 0x0
    */
    public static let IOTIZE_200_NO_ERROR: UInt8 = 0x0;

   /**
    * 
    * Hex: 0xB9 UInt: 0xB9 Int: 0xB9
    */
    public static let IOTIZE_TARGET_PROTOCOL_INT: UInt8 = 0xB9;

   /**
    * PENDING
    * Hex: 0x1 UInt: 0x1 Int: 0x1
    */
    public static let IOTIZE_PENDING: UInt8 = 0x1;

   /**
    * 
    * Hex: 0xB8 UInt: 0xB8 Int: 0xB8
    */
    public static let IOTIZE_TARGET_PROTOCOL_PARAM: UInt8 = 0xB8;

   /**
    * 
    * Hex: 0xB7 UInt: 0xB7 Int: 0xB7
    */
    public static let IOTIZE_TARGET_PROTOCOL_LOST_COM: UInt8 = 0xB7;

   /**
    * 
    * Hex: 0xB6 UInt: 0xB6 Int: 0xB6
    */
    public static let IOTIZE_TARGET_PROTOCOL_COM: UInt8 = 0xB6;

   /**
    * 
    * Hex: 0xB5 UInt: 0xB5 Int: 0xB5
    */
    public static let IOTIZE_TARGET_PROTOCOL_DATA: UInt8 = 0xB5;

   /**
    * 
    * Hex: 0xB4 UInt: 0xB4 Int: 0xB4
    */
    public static let IOTIZE_TARGET_PROTOCOL_FORBIDDEN: UInt8 = 0xB4;

   /**
    * 
    * Hex: 0xB3 UInt: 0xB3 Int: 0xB3
    */
    public static let IOTIZE_TARGET_PROTOCOL_WRONG_PARAM: UInt8 = 0xB3;

   /**
    * 
    * Hex: 0xB2 UInt: 0xB2 Int: 0xB2
    */
    public static let IOTIZE_TARGET_PROTOCOL_REAL: UInt8 = 0xB2;

}