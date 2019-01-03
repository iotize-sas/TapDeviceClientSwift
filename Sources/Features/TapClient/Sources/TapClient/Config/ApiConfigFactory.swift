/**
 * This file has been generated
 * DO NOT EDIT DIRECTLY, IT MAY BE OVERWRITE
 */


//open class ApiConfigFactory{
//
//    public static _?: ApiConfig;
//
//    public static getDefaultInstance(){
//        if (!ApiConfigFactory._) {
//            ApiConfigFactory._ = new ApiConfig(
//                defaultRoutes,
//SwaggerClient defaultConverters,
//                defaultAliases
//            );
//        }
//        return ApiConfigFactory._;
//    }
//}

//open const defaultAliases = {
//
//   
//   "/device/current-time": "/3//13",
//    
//
//   
//   "/interface/config-format-version": "/1024//8",
//    
//
//   
//   "/target/transparent/send-receive": "/1027//34",
//    
//
//   
//   "/interface/available-host-protocols": "/1024//21",
//    
//
//   
//   "/target/com-stats": "/1027//11",
//    
//
//   
//   "/group/{groupId}/scram-user-iteration": "/1025/{groupId}/7",
//    
//
//   
//   "/interface/host-inactivity-period": "/1024//34",
//    
//
//   
//   "/interface/cloud/connection-mode": "/1024//26",
//    
//
//   
//   "/device/last-error-code": "/3//11",
//    
//
//   
//   "/target/core-type": "/1027//2",
//    
//
//   
//   "/device/power-source-voltage": "/3//7",
//    
//
//   
//   "/interface/cloud/password": "/1024//29",
//    
//
//   
//   "/acl/{objectId}/list": "/2/{objectId}/2",
//    
//
//   
//   "/interface/scram/initialize": "/1024//47",
//    
//
//   
//   "/target/firmware-version": "/1027//6",
//    
//
//   
//   "/firmware/package": "/5//0",
//    
//
//   
//   "/target/modbus/sub-protocol": "/1027//40",
//    
//
//   
//   "/device/public-password": "/3//17",
//    
//
//   
//   "/interface/power-optimisation-level": "/1024//14",
//    
//
//   
//   "/interface/current-host-protocol": "/1024//3",
//    
//
//   
//   "/target/transparent/send": "/1027//34",
//    
//
//   
//   "/device/serial-number": "/3//2",
//    
//
//   
//   "/single-packet/write": "/1024//80",
//    
//
//   
//   "/interface/scram/hash-it": "/1024//42",
//    
//
//   
//   "/interface/login-with-hash": "/1024//0",
//    
//
//   
//   "/datalog/options": "/1031//2",
//    
//
//   
//   "/interface/app-path": "/1024//11",
//    
//
//   
//   "/interface/functions": "/1024//20",
//    
//
//   
//   "/variable/{variableId}/current-access": "/1029/{variableId}/3",
//    
//
//   
//   "/interface/keep-alive": "/1024//4",
//    
//
//   
//   "/bundle/{bundleId}/values": "/1028/{bundleId}/1",
//    
//
//   
//   "/device/firmware-version": "/3//3",
//    
//
//   
//   "/variable/{variableId}/bundle/id": "/1029/{variableId}/6",
//    
//
//   
//   "/interface/network-mode": "/1024//15",
//    
//
//   
//   "/target/reset": "/1027//5",
//    
//
//   
//   "/target/reset-keep": "/1027//30",
//    
//
//   
//   "/variable/{variableId}/address": "/1029/{variableId}/0",
//    
//
//   
//   "/secure-element/com": "/1024//71",
//    
//
//   
//   "/target/disconnect": "/1027//4",
//    
//
//   
//   "/interface/config-format-firmware-version": "/1024//18",
//    
//
//   
//   "/target/modbus/read": "/1027//38",
//    
//
//   
//   "/variable/{variableId}/set-value": "/1029/{variableId}/5",
//    
//
//   
//   "/target/read-address": "/1030//13",
//    
//
//   
//   "/target/modbus/write": "/1027//37",
//    
//
//   
//   "/interface/network/infra-ip-mask": "/1024//32",
//    
//
//   
//   "/interface/mqtt/relay/password": "/1024//54",
//    
//
//   
//   "/interface/cloud-gateway-url": "/1024//12",
//    
//
//   
//   "/interface/cloud/client-id": "/3//2",
//    
//
//   
//   "/interface/login-uid": "/1024//5",
//    
//
//   
//   "/single-packet/bspe": "/1024//83",
//    
//
//   
//   "/target/protocol": "/1027//1",
//    
//
//   
//   "/interface/mqtt/relay/client-id": "/3//2",
//    
//
//   
//   "/target/adp/action": "/1027//39",
//    
//
//   
//   "/interface/public-password": "/1024//60",
//    
//
//   
//   "/acl/{objectId}/object-id": "/2/{objectId}/0",
//    
//
//   
//   "/firmware/update": "/5//2",
//    
//
//   
//   "/target/min-voltage": "/1027//8",
//    
//
//   
//   "/single-packet/part": "/1024//82",
//    
//
//   
//   "/interface/authorized-host-protocol": "/1024//17",
//    
//
//   
//   "/datalog/crypto-key": "/1031//3",
//    
//
//   
//   "/interface/wep-key": "/1024//16",
//    
//
//   
//   "/bundle/{bundleId}/acl/{groupId}": "/1028/{bundleId}/0/{groupId}",
//    
//
//   
//   "/secure-element/configure": "/1024//70",
//    
//
//   
//   "/datalog/max-packet-count": "/1024//23",
//    
//
//   
//   "/device/model-name": "/3//1",
//    
//
//   
//   "/datalog/packet-count": "/1031//10",
//    
//
//   
//   "/variable/{variableId}/value": "/1029/{variableId}/4",
//    
//
//   
//   "/interface/wifi/hostname": "/1024//35",
//    
//
//   
//   "/interface/lock": "/1024//6",
//    
//
//   
//   "/device/memory-free": "/3//10",
//    
//
//   
//   "/interface/mqtt/relay/url": "/1024//50",
//    
//
//   
//   "/datalog/flush": "/1031//4",
//    
//
//   
//   "/interface/rand": "/1024//49",
//    
//
//   
//   "/interface/network/infra-ip": "/1024//30",
//    
//
//   
//   "/interface/mqtt/relay/login": "/3//2",
//    
//
//   
//   "/interface/ble/address": "/1024//22",
//    
//
//   
//   "/interface/wifi/ssid": "/1024//25",
//    
//
//   
//   "/group/{groupId}/session-lifetime": "/1025/{groupId}/4",
//    
//
//   
//   "/bundle/{bundleId}/datalog-period": "/1028/{bundleId}/2",
//    
//
//   
//   "/device/manufacturer": "/3//0",
//    
//
//   
//   "/interface/current-group-id": "/1024//7",
//    
//
//   
//   "/group/{groupId}/name": "/1025/{groupId}/0",
//    
//
//   
//   "/interface/scram/login": "/1024//40",
//    
//
//   
//   "/interface/scram/login-proof": "/1024//41",
//    
//
//   
//   "/device/available-power-source": "/3//6",
//    
//
//   
//   "/interface/cloud/service-name": "/1024//61",
//    
//
//   
//   "/target/uart/settings": "/1027//21",
//    
//
//   
//   "/variable/{variableId}/bundle/values": "/1029/{variableId}/7",
//    
//
//   
//   "/target/vcc": "/1027//7",
//    
//
//   
//   "/target/debug-access": "/1027//31",
//    
//
//   
//   "/interface/config-version": "/1024//10",
//    
//
//   
//   "/datalog/run": "/1031//0",
//    
//
//   
//   "/group/{groupId}/password": "/1025/{groupId}/2",
//    
//
//   
//   "/interface/scram/com-send-receive": "/1024//48",
//    
//
//   
//   "/variable/{variableId}/number-of-elements": "/1029/{variableId}/2",
//    
//
//   
//   "/single-packet-store/info": "/1024//80",
//    
//
//   
//   "/interface/cloud/login": "/3//2",
//    
//
//   
//   "/target/page-size": "/1027//10",
//    
//
//   
//   "/firmware/update-result": "/5//5",
//    
//
//   
//   "/interface/mqtt/relay/port": "/1024//51",
//    
//
//   
//   "/interface/network/gateway-ip": "/1024//31",
//    
//
//   
//   "/variable/{variableId}/format": "/1029/{variableId}/1",
//    
//
//   
//   "/target/reg-access": "/1027//32",
//    
//
//   
//   "/acl/{objectId}/owner": "/2/{objectId}/3",
//    
//
//   
//   "/interface/multi-commands": "/1024//89",
//    
//
//   
//   "/target/adp/status": "/1027//36",
//    
//
//   
//   "/target/connect": "/1027//3",
//    
//
//   
//   "/interface/login": "/1024//0",
//    
//
//   
//   "/firmware/crc-check": "/5//6",
//    
//
//   
//   "/acl/{objectId}/instance-id": "/2/{objectId}/1",
//    
//
//   
//   "/interface/app-name": "/1024//9",
//    
//
//   
//   "/datalog/dequeue-packet": "/1031//11",
//    
//
//   
//   "/device/factory-reset": "/3//5",
//    
//
//   
//   "/target/max-voltage": "/1027//9",
//    
//
//   
//   "/interface/mqtt/relay/net-key": "/1024//55",
//    
//
//   
//   "/target/protocol/list": "/1027//20",
//    
//
//   
//   "/firmware/state": "/5//3",
//    
//
//   
//   "/interface/nfc/pairing-mode": "/1024//13",
//    
//
//   
//   "/interface/cloud/mqtt-period": "/1024//33",
//    
//
//   
//   "/interface/current-profile/id": "/1024//2",
//    
//
//   
//   "/device/reboot": "/3//4",
//    
//
//   
//   "/device/reset-last-error-code": "/3//12",
//    
//
//   
//   "/group/{groupId}/scram-user-salt": "/1025/{groupId}/16",
//    
//
//   
//   "/datalog/stop": "/1031//1",
//    
//
//   
//   "/interface/logout": "/1024//1",
//    
//
//   
//   "/target/transparent/read-bytes": "/1027//35",
//    
//
//   
//   "/group/{groupId}/alias": "/1025/{groupId}/5",
//    
//
//}

//let defaultRoutes: Routes = {

// let converterProvider = ConverterProvider()
// {%for schema in schemas%}
// converterProvider.add(Converter())
// {% endfor%}
//    
//        
//        "get /1024//42": {
//            
 //           
//        },
//        
//    
//        
//        "put /1024//32": {
//            
 //           "bodyEncoder": "string_ipv4mask",
//        },
//        
//    
//        
//        "get /3//0": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "get /1031//10": {
//            "returnTypeConverter": "integer_uint16",
 //           
//        },
//        
//    
//        
//        "get /1027//1": {
//            "returnTypeConverter": "TargetProtocol",
 //           
//        },
//        
//    
//        
//        "get /1024//40": {
//            "returnTypeConverter": "ScramLoginResponseBody",
 //           "bodyEncoder": "ScramLoginParams",
//        },
//        
//    
//        
//        "get /1028/{bundleId}/1": {
//            "returnTypeConverter": "Bytes",
 //           
//        },
//        
//    
//        
//        "get /1027//37": {
//            
 //           "bodyEncoder": "MemoryWriteInfo",
//        },
//        
//    
//        
//        "get /1024//15": {
//            "returnTypeConverter": "NetworkMode",
 //           
//        },
//        
//    
//        
//        "put /1024//26": {
//            
 //           "bodyEncoder": "CloudConnectionMode",
//        },
//        
//    
//        
//        "put /1027//1": {
//            
 //           "bodyEncoder": "TargetProtocol",
//        },
//        
//    
//        
//        "get /1027//2": {
//            "returnTypeConverter": "TargetCoreType",
 //           
//        },
//        
//    
//        
//        "get /1027//6": {
//            "returnTypeConverter": "string_version",
 //           
//        },
//        
//    
//        
//        "put /1029/{variableId}/6": {
//            
 //           "bodyEncoder": "integer_uint32",
//        },
//        
//    
//        
//        "get /1024//13": {
//            "returnTypeConverter": "NfcPairingMode",
 //           
//        },
//        
//    
//        
//        "get /1025/{groupId}/16": {
//            "returnTypeConverter": "integer_uint32",
 //           
//        },
//        
//    
//        
//        "get /1027//31": {
//            
 //           
//        },
//        
//    
//        
//        "put /1024//25": {
//            
 //           "bodyEncoder": "string",
//        },
//        
//    
//        
//        "put /1027//2": {
//            
 //           "bodyEncoder": "TargetCoreType",
//        },
//        
//    
//        
//        "post /1031//1": {
//            
 //           
//        },
//        
//    
//        
//        "put /1024//12": {
//            
 //           "bodyEncoder": "string",
//        },
//        
//    
//        
//        "post /3//12": {
//            
 //           
//        },
//        
//    
//        
//        "post /1024//0": {
//            
 //           "bodyEncoder": "LoginCredentialHashed",
//        },
//        
//    
//        
//        "put /1024//54": {
//            
 //           "bodyEncoder": "string",
//        },
//        
//    
//        
//        "post /1027//3": {
//            
 //           
//        },
//        
//    
//        
//        "get /1025/{groupId}/0": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "post /1024//10": {
//            
 //           
//        },
//        
//    
//        
//        "get /1024//61": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "post /1029/{variableId}/5": {
//            
 //           "bodyEncoder": "Bytes",
//        },
//        
//    
//        
//        "post /1027//34": {
//            "returnTypeConverter": "Bytes",
 //           "bodyEncoder": "Bytes",
//        },
//        
//    
//        
//        "get /3//11": {
//            "returnTypeConverter": "integer_uint32",
 //           
//        },
//        
//    
//        
//        "post /1031//0": {
//            
 //           
//        },
//        
//    
//        
//        "get /1024//11": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "get /1024//89": {
//            "returnTypeConverter": "TapMultiResponse",
 //           "bodyEncoder": "TapMultiRequest",
//        },
//        
//    
//        
//        "put /1025/{groupId}/4": {
//            
 //           "bodyEncoder": "integer_uint16",
//        },
//        
//    
//        
//        "put /1028/{bundleId}/2": {
//            
 //           "bodyEncoder": "integer_uint32",
//        },
//        
//    
//        
//        "get /1029/{variableId}/0": {
//            "returnTypeConverter": "integer_uint32",
 //           
//        },
//        
//    
//        
//        "put /1024//3": {
//            
 //           "bodyEncoder": "HostProtocol",
//        },
//        
//    
//        
//        "get /1027//21": {
//            "returnTypeConverter": "UartSettings",
 //           
//        },
//        
//    
//        
//        "post /1027//21": {
//            
 //           "bodyEncoder": "UartSettings",
//        },
//        
//    
//        
//        "get /1027//7": {
//            "returnTypeConverter": "integer_uint16",
 //           
//        },
//        
//    
//        
//        "post /1027//32": {
//            
 //           
//        },
//        
//    
//        
//        "put /1027//6": {
//            
 //           "bodyEncoder": "integer_uint32",
//        },
//        
//    
//        
//        "get /3//2": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "get /2/{objectId}/0": {
//            "returnTypeConverter": "integer_uint16",
 //           
//        },
//        
//    
//        
//        "get /1024//20": {
//            "returnTypeConverter": "AvailableFunction",
 //           
//        },
//        
//    
//        
//        "get /3//2": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "put /1027//9": {
//            
 //           "bodyEncoder": "integer_uint16",
//        },
//        
//    
//        
//        "put /1024//6": {
//            
 //           "bodyEncoder": "InterfaceLock",
//        },
//        
//    
//        
//        "put /1031//2": {
//            
 //           "bodyEncoder": "DatalogOption",
//        },
//        
//    
//        
//        "put /1031//3": {
//            
 //           "bodyEncoder": "Bytes",
//        },
//        
//    
//        
//        "post /1025/{groupId}/2": {
//            
 //           "bodyEncoder": "string",
//        },
//        
//    
//        
//        "put /1024//16": {
//            
 //           "bodyEncoder": "string",
//        },
//        
//    
//        
//        "put /1025/{groupId}/5": {
//            
 //           "bodyEncoder": "integer_uint16",
//        },
//        
//    
//        
//        "put /1027//8": {
//            
 //           "bodyEncoder": "integer_uint16",
//        },
//        
//    
//        
//        "get /1029/{variableId}/2": {
//            "returnTypeConverter": "integer_uint8",
 //           
//        },
//        
//    
//        
//        "get /1024//18": {
//            "returnTypeConverter": "string_version",
 //           
//        },
//        
//    
//        
//        "get /1024//80": {
//            "returnTypeConverter": "Bytes",
 //           
//        },
//        
//    
//        
//        "get /1024//4": {
//            "returnTypeConverter": "integer_uint32",
 //           
//        },
//        
//    
//        
//        "post /3//11": {
//            
 //           
//        },
//        
//    
//        
//        "get /1028/{tupId}": {
//            
 //           
//        },
//        
//    
//        
//        "get /1024//26": {
//            "returnTypeConverter": "CloudConnectionMode",
 //           
//        },
//        
//    
//        
//        "get /1027//34": {
//            "returnTypeConverter": "Bytes",
 //           "bodyEncoder": "Bytes",
//        },
//        
//    
//        
//        "post /3//5": {
//            
 //           
//        },
//        
//    
//        
//        "post /1024//0": {
//            
 //           "bodyEncoder": "LoginCredential",
//        },
//        
//    
//        
//        "get /1024//70": {
//            "returnTypeConverter": "Bytes",
 //           
//        },
//        
//    
//        
//        "get /1024//9": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "put /1029/{variableId}/2": {
//            
 //           "bodyEncoder": "integer_uint8",
//        },
//        
//    
//        
//        "put /1024//14": {
//            
 //           "bodyEncoder": "LowPowerOptimisationLevel",
//        },
//        
//    
//        
//        "get /1027//9": {
//            "returnTypeConverter": "integer_uint16",
 //           
//        },
//        
//    
//        
//        "put /1024//13": {
//            
 //           "bodyEncoder": "NfcPairingMode",
//        },
//        
//    
//        
//        "get /1024//17": {
//            "returnTypeConverter": "ListHostProtocol",
 //           
//        },
//        
//    
//        
//        "put /1024//15": {
//            
 //           "bodyEncoder": "NetworkMode",
//        },
//        
//    
//        
//        "post /1027//40": {
//            
 //           "bodyEncoder": "Bytes",
//        },
//        
//    
//        
//        "get /1024//31": {
//            "returnTypeConverter": "string_ipv4",
 //           
//        },
//        
//    
//        
//        "get /1027//11": {
//            "returnTypeConverter": "TargetComStats",
 //           
//        },
//        
//    
//        
//        "post /5//0": {
//            
 //           
//        },
//        
//    
//        
//        "put /1024//34": {
//            
 //           "bodyEncoder": "integer_uint16",
//        },
//        
//    
//        
//        "put /1028/{bundleId}/0/{groupId}": {
//            
 //           "bodyEncoder": "ReadWriteRights",
//        },
//        
//    
//        
//        "put /1024//10": {
//            
 //           "bodyEncoder": "integer_uint32",
//        },
//        
//    
//        
//        "put /1024//29": {
//            
 //           "bodyEncoder": "string",
//        },
//        
//    
//        
//        "post /1024//1": {
//            
 //           
//        },
//        
//    
//        
//        "get /1024//25": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "post /1027//31": {
//            
 //           
//        },
//        
//    
//        
//        "get /1029/{variableId}/7": {
//            "returnTypeConverter": "integer_uint16",
 //           
//        },
//        
//    
//        
//        "get /1024//6": {
//            "returnTypeConverter": "InterfaceLock",
 //           
//        },
//        
//    
//        
//        "get /1024//60": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "put /1029/{variableId}/1": {
//            
 //           "bodyEncoder": "integer_uint8",
//        },
//        
//    
//        
//        "get /1025/{groupId}/5": {
//            "returnTypeConverter": "integer_uint16",
 //           
//        },
//        
//    
//        
//        "get /1027//32": {
//            
 //           
//        },
//        
//    
//        
//        "get /1024//49": {
//            "returnTypeConverter": "Bytes",
 //           
//        },
//        
//    
//        
//        "post /5//6": {
//            "returnTypeConverter": "Bytes",
 //           "bodyEncoder": "CrcCheckBody",
//        },
//        
//    
//        
//        "get /1024//3": {
//            "returnTypeConverter": "HostProtocol",
 //           
//        },
//        
//    
//        
//        "get /1027//40": {
//            "returnTypeConverter": "Bytes",
 //           
//        },
//        
//    
//        
//        "get /1024//54": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "put /1025/{groupId}/7": {
//            
 //           "bodyEncoder": "integer_uint32",
//        },
//        
//    
//        
//        "get /1024//12": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "get /3//3": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "get /5//3": {
//            "returnTypeConverter": "FirmwareState",
 //           
//        },
//        
//    
//        
//        "put /1024//11": {
//            
 //           "bodyEncoder": "string",
//        },
//        
//    
//        
//        "get /3//2": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "get /1031//11": {
//            "returnTypeConverter": "SinglePacket",
 //           
//        },
//        
//    
//        
//        "get /1024//2": {
//            "returnTypeConverter": "integer_uint16",
 //           
//        },
//        
//    
//        
//        "get /3//2": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "post /1027//11": {
//            
 //           
//        },
//        
//    
//        
//        "put /1027//10": {
//            
 //           "bodyEncoder": "integer_uint32",
//        },
//        
//    
//        
//        "get /3//10": {
//            "returnTypeConverter": "integer_uint32",
 //           
//        },
//        
//    
//        
//        "get /1029/{variableId}/4": {
//            "returnTypeConverter": "Bytes",
 //           
//        },
//        
//    
//        
//        "get /5//5": {
//            "returnTypeConverter": "FirmwareUpdateResult",
 //           
//        },
//        
//    
//        
//        "get /1024//10": {
//            "returnTypeConverter": "string_version",
 //           
//        },
//        
//    
//        
//        "put /1029/{variableId}/0": {
//            
 //           "bodyEncoder": "integer_uint32",
//        },
//        
//    
//        
//        "get /1024//35": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "get /1029/{variableId}/6": {
//            "returnTypeConverter": "integer_uint16",
 //           
//        },
//        
//    
//        
//        "get /1024//48": {
//            "returnTypeConverter": "Bytes",
 //           "bodyEncoder": "Bytes",
//        },
//        
//    
//        
//        "put /1024//9": {
//            
 //           "bodyEncoder": "string",
//        },
//        
//    
//        
//        "get /1024//55": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "put /1024//61": {
//            
 //           "bodyEncoder": "string",
//        },
//        
//    
//        
//        "put /2/{objectId}/2": {
//            
 //           
//        },
//        
//    
//        
//        "get /1027//36": {
//            "returnTypeConverter": "Bytes",
 //           
//        },
//        
//    
//        
//        "get /1027//20": {
//            "returnTypeConverter": "ListTargetProtocol",
 //           
//        },
//        
//    
//        
//        "get /1024//32": {
//            "returnTypeConverter": "string_ipv4mask",
 //           
//        },
//        
//    
//        
//        "put /3//13": {
//            
 //           
//        },
//        
//    
//        
//        "put /2/{objectId}/3": {
//            
 //           "bodyEncoder": "integer_uint32",
//        },
//        
//    
//        
//        "get /1024//16": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "get /3//13": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "post /1024//83": {
//            "returnTypeConverter": "Bytes",
 //           "bodyEncoder": "Bytes",
//        },
//        
//    
//        
//        "get /3//2": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "get /1024//71": {
//            "returnTypeConverter": "Bytes",
 //           "bodyEncoder": "Bytes",
//        },
//        
//    
//        
//        "post /1031//4": {
//            
 //           
//        },
//        
//    
//        
//        "post /1024//5": {
//            
 //           "bodyEncoder": "Bytes",
//        },
//        
//    
//        
//        "get /1027//10": {
//            "returnTypeConverter": "integer_uint32",
 //           
//        },
//        
//    
//        
//        "post /1024//82": {
//            "returnTypeConverter": "Bytes",
 //           "bodyEncoder": "Bytes",
//        },
//        
//    
//        
//        "put /1027//21": {
//            
 //           "bodyEncoder": "UartSettings",
//        },
//        
//    
//        
//        "get /2/{objectId}/1": {
//            "returnTypeConverter": "integer_uint16",
 //           
//        },
//        
//    
//        
//        "post /1027//4": {
//            
 //           
//        },
//        
//    
//        
//        "put /1024//50": {
//            
 //           "bodyEncoder": "string",
//        },
//        
//    
//        
//        "get /3//1": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "post /1024//80": {
//            "returnTypeConverter": "Bytes",
 //           "bodyEncoder": "Bytes",
//        },
//        
//    
//        
//        "get /2/{objectId}/3": {
//            "returnTypeConverter": "integer_uint16",
 //           
//        },
//        
//    
//        
//        "get /1024//8": {
//            "returnTypeConverter": "string_version",
 //           
//        },
//        
//    
//        
//        "put /1025/{groupId}/0": {
//            
 //           "bodyEncoder": "string",
//        },
//        
//    
//        
//        "post /1027//30": {
//            
 //           
//        },
//        
//    
//        
//        "get /3//6": {
//            "returnTypeConverter": "AvailablePowerSource",
 //           
//        },
//        
//    
//        
//        "get /1024//33": {
//            "returnTypeConverter": "integer_uint32",
 //           
//        },
//        
//    
//        
//        "put /1024//70": {
//            
 //           "bodyEncoder": "Bytes",
//        },
//        
//    
//        
//        "get /1024//22": {
//            "returnTypeConverter": "string_macaddress",
 //           
//        },
//        
//    
//        
//        "get /1025/{groupId}/7": {
//            "returnTypeConverter": "integer_uint32",
 //           
//        },
//        
//    
//        
//        "get /1027//38": {
//            "returnTypeConverter": "Bytes",
 //           "bodyEncoder": "MemoryInfo",
//        },
//        
//    
//        
//        "post /3//4": {
//            
 //           
//        },
//        
//    
//        
//        "get /1024//41": {
//            "returnTypeConverter": "Bytes",
 //           "bodyEncoder": "Bytes",
//        },
//        
//    
//        
//        "put /1029/{variableId}/4": {
//            
 //           "bodyEncoder": "Bytes",
//        },
//        
//    
//        
//        "get /1024//21": {
//            "returnTypeConverter": "ListHostProtocol",
 //           
//        },
//        
//    
//        
//        "put /1024//51": {
//            
 //           "bodyEncoder": "string",
//        },
//        
//    
//        
//        "put /1024//55": {
//            
 //           "bodyEncoder": "string",
//        },
//        
//    
//        
//        "get /1030//13": {
//            "returnTypeConverter": "Bytes",
 //           "bodyEncoder": "MemoryInfo",
//        },
//        
//    
//        
//        "post /5//2": {
//            
 //           
//        },
//        
//    
//        
//        "get /1024//29": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "get /1029/{variableId}/1": {
//            "returnTypeConverter": "integer_uint8",
 //           
//        },
//        
//    
//        
//        "get /1024//23": {
//            "returnTypeConverter": "integer_uint16",
 //           
//        },
//        
//    
//        
//        "get /1024//51": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "get /1027//35": {
//            "returnTypeConverter": "Bytes",
 //           "bodyEncoder": "integer_uint32",
//        },
//        
//    
//        
//        "get /1024//47": {
//            "returnTypeConverter": "Bytes",
 //           
//        },
//        
//    
//        
//        "put /1024//30": {
//            
 //           "bodyEncoder": "string_ipv4",
//        },
//        
//    
//        
//        "get /1024//50": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "put /1024//33": {
//            
 //           "bodyEncoder": "integer_uint32",
//        },
//        
//    
//        
//        "get /3//17": {
//            "returnTypeConverter": "string",
 //           
//        },
//        
//    
//        
//        "put /1024//8": {
//            
 //           "bodyEncoder": "integer_uint32",
//        },
//        
//    
//        
//        "get /3//7": {
//            "returnTypeConverter": "integer_uint32",
 //           
//        },
//        
//    
//        
//        "get /1029/{variableId}/3": {
//            "returnTypeConverter": "ReadWriteRights",
 //           
//        },
//        
//    
//        
//        "post /1030//13": {
//            
 //           "bodyEncoder": "MemoryWriteInfo",
//        },
//        
//    
//        
//        "put /1025/{groupId}/16": {
//            
 //           "bodyEncoder": "integer_uint32",
//        },
//        
//    
//        
//        "put /1024//31": {
//            
 //           "bodyEncoder": "string_ipv4",
//        },
//        
//    
//        
//        "post /1027//5": {
//            
 //           
//        },
//        
//    
//        
//        "get /2/{objectId}/2": {
//            "returnTypeConverter": "ListAclEntry",
 //           
//        },
//        
//    
//        
//        "get /1024//34": {
//            "returnTypeConverter": "integer_uint16",
 //           
//        },
//        
//    
//        
//        "get /1024//30": {
//            "returnTypeConverter": "string_ipv4",
 //           
//        },
//        
//    
//        
//        "get /1027//8": {
//            "returnTypeConverter": "integer_uint16",
 //           
//        },
//        
//    
//        
//        "get /1024//14": {
//            "returnTypeConverter": "LowPowerOptimisationLevel",
 //           
//        },
//        
//    
//        
//        "get /1025/{groupId}/4": {
//            "returnTypeConverter": "integer_uint16",
 //           
//        },
//        
//    
//        
//        "get /1028/{bundleId}/2": {
//            "returnTypeConverter": "integer_uint32",
 //           
//        },
//        
//    
//        
//        "post /1027//39": {
//            
 //           "bodyEncoder": "Bytes",
//        },
//        
//    
//        
//        "get /1024//7": {
//            "returnTypeConverter": "integer_uint16",
 //           
//        },
//        
//    
//        
//        "put /1024//17": {
//            
 //           "bodyEncoder": "ListHostProtocol",
//        },
//        
//    
//        
//        "get /1031//2": {
//            "returnTypeConverter": "DatalogOption",
 //           
//        },
//        
//    
//}

//let defaultConverters = {
//    
//        
//            
//    "integer_uint16": integer_uint16Converter.instance(),
//            
//        
//    
//        
//            
//    "string_ipv4mask": string_ipv4maskConverter.instance(),
//            
//        
//    
//        
//            
//    "TargetCoreType": TargetCoreTypeConverter.instance(),
//            
//        
//    
//        
//            
//    "string": stringConverter.instance(),
//            
//        
//    
//        
//            
//    "HostProtocol": HostProtocolConverter.instance(),
//            
//        
//    
//        
//            
//    "TargetProtocol": TargetProtocolConverter.instance(),
//            
//        
//    
//        
//            
//    "UartSettings": UartSettingsConverter.instance(),
//            
//        
//    
//        
//            
//    "TapMultiRequest": TapMultiRequestConverter.instance(),
//            
//        
//    
//        
//            
//    "SinglePacket": SinglePacketConverter.instance(),
//            
//        
//    
//        
//            
//    "integer_uint8": integer_uint8Converter.instance(),
//            
//        
//    
//        
//            
//    "FirmwareUpdateResult": FirmwareUpdateResultConverter.instance(),
//            
//        
//    
//        
//            
//    "TapMultiResponse": TapMultiResponseConverter.instance(),
//            
//        
//    
//        
//            
//    "Bytes": BytesConverter.instance(),
//            
//        
//    
//        
//            
//    "NfcPairingMode": NfcPairingModeConverter.instance(),
//            
//        
//    
//        
//            
//    "ScramLoginParams": ScramLoginParamsConverter.instance(),
//            
//        
//    
//        
//            
//    "ReadWriteRights": ReadWriteRightsConverter.instance(),
//            
//        
//    
//        
//            
//    "LoginCredentialHashed": LoginCredentialHashedConverter.instance(),
//            
//        
//    
//        
//            
//    "CrcCheckBody": CrcCheckBodyConverter.instance(),
//            
//        
//    
//        
//            
//    "FirmwareState": FirmwareStateConverter.instance(),
//            
//        
//    
//        
//            
//    "AvailablePowerSource": AvailablePowerSourceConverter.instance(),
//            
//        
//    
//        
//            
//    "AvailableFunction": AvailableFunctionConverter.instance(),
//            
//        
//    
//        
//            
//    "string_ipv4": string_ipv4Converter.instance(),
//            
//        
//    
//        
//            
//    "LowPowerOptimisationLevel": LowPowerOptimisationLevelConverter.instance(),
//            
//        
//    
//        
//            
//    "NetworkMode": NetworkModeConverter.instance(),
//            
//        
//    
//        
//            
//    "string_macaddress": string_macaddressConverter.instance(),
//            
//        
//    
//        
//            
//    "DatalogOption": DatalogOptionConverter.instance(),
//            
//        
//    
//        
//            
//    "ListHostProtocol": ListHostProtocolConverter.instance(),
//            
//        
//    
//        
//            
//    "ListAclEntry": ListAclEntryConverter.instance(),
//            
//        
//    
//        
//            
//    "string_version": string_versionConverter.instance(),
//            
//        
//    
//        
//            
//    "MemoryInfo": MemoryInfoConverter.instance(),
//            
//        
//    
//        
//            
//    "MemoryWriteInfo": MemoryWriteInfoConverter.instance(),
//            
//        
//    
//        
//            
//    "CloudConnectionMode": CloudConnectionModeConverter.instance(),
//            
//        
//    
//        
//            
//    "integer_uint32": integer_uint32Converter.instance(),
//            
//        
//    
//        
//            
//    "InterfaceLock": InterfaceLockConverter.instance(),
//            
//        
//    
//        
//            
//    "ScramLoginResponseBody": ScramLoginResponseBodyConverter.instance(),
//            
//        
//    
//        
//            
//    "LoginCredential": LoginCredentialConverter.instance(),
//            
//        
//    
//        
//            
//    "ListTargetProtocol": ListTargetProtocolConverter.instance(),
//            
//        
//    
//        
//            
//    "TargetComStats": TargetComStatsConverter.instance(),
//            
//        
//    
//}

