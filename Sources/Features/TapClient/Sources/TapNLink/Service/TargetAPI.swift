//
// TargetAPI.swift
//
// Generated by iotize device api codegen
//

import Foundation
import TapClientApi
// 



open class TargetAPI {

    var client: TapClient
    var converterProvider: ConverterProvider

    init(client: TapClient, converterProvider: ConverterProvider){
        self.client = client
        self.converterProvider = converterProvider
    }

    /**
    * Clear communication stats 
    * 
    * LWM2M path: /1027//11
    * @return  api call
    */
    public func clearComStatsRequest()
         -> ApiRequest<Void>{
        var path = "/1027//11"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.POST
            , path: path
        )
    }

     /**
        * Clear communication stats 
        * 
        * LWM2M path: /1027//11
                * @return  api call
        */
        public func clearComStats()
             throws -> ApiResponse<Void>{
            let request : ApiRequest<Void> = self.clearComStatsRequest()
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * Connect to target
    * 
    * LWM2M path: /1027//3
    * @return  api call
    */
    public func connectRequest()
         -> ApiRequest<Void>{
        var path = "/1027//3"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.POST
            , path: path
        )
    }

     /**
        * Connect to target
        * 
        * LWM2M path: /1027//3
                * @return  api call
        */
        public func connect()
             throws -> ApiResponse<Void>{
            let request : ApiRequest<Void> = self.connectRequest()
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * Disconnect from target
    * 
    * LWM2M path: /1027//4
    * @return  api call
    */
    public func disconnectRequest()
         -> ApiRequest<Void>{
        var path = "/1027//4"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.POST
            , path: path
        )
    }

     /**
        * Disconnect from target
        * 
        * LWM2M path: /1027//4
                * @return  api call
        */
        public func disconnect()
             throws -> ApiResponse<Void>{
            let request : ApiRequest<Void> = self.disconnectRequest()
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * Get communication stats
    * Get Nb of failed communications and number of successful communications with Target
    * LWM2M path: /1027//11
    * @return TargetComStats api call
    */
    public func getComStatsRequest()
         -> ApiRequest<Void>{
        var path = "/1027//11"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: path
        )
    }

     /**
        * Get communication stats
        * Get Nb of failed communications and number of successful communications with Target
        * LWM2M path: /1027//11
                * @return TargetComStats api call
        */
        public func getComStats()
             throws -> ApiResponse<TargetComStats>{
            let request : ApiRequest<Void> = self.getComStatsRequest()
            let converter: TapConverterContainer<TargetComStats> = self.converterProvider.get(id: "TargetComStats")
            let response: ApiResponse<TargetComStats> = try self.client.execute(request: request, converter: converter)

            return response
        }
    /**
    * Get core type
    * 
    * LWM2M path: /1027//2
    * @return TargetCoreType api call
    */
    public func getCoreTypeRequest()
         -> ApiRequest<Void>{
        var path = "/1027//2"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: path
        )
    }

     /**
        * Get core type
        * 
        * LWM2M path: /1027//2
                * @return TargetCoreType api call
        */
        public func getCoreType()
             throws -> ApiResponse<TargetCoreType>{
            let request : ApiRequest<Void> = self.getCoreTypeRequest()
            let converter: TapConverterContainer<TargetCoreType> = self.converterProvider.get(id: "TargetCoreType")
            let response: ApiResponse<TargetCoreType> = try self.client.execute(request: request, converter: converter)

            return response
        }
    /**
    * Debug access
    * Access registres de contrôle (SWD&#x3D;&gt;APDP) de la cible.  Accès conditionné par les ACLs du Bundle Debug (-2)
    * LWM2M path: /1027//31
    * @return  api call
    */
    public func getDebugAccessRequest()
         -> ApiRequest<Void>{
        var path = "/1027//31"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: path
        )
    }

     /**
        * Debug access
        * Access registres de contrôle (SWD&#x3D;&gt;APDP) de la cible.  Accès conditionné par les ACLs du Bundle Debug (-2)
        * LWM2M path: /1027//31
                * @return  api call
        */
        public func getDebugAccess()
             throws -> ApiResponse<Void>{
            let request : ApiRequest<Void> = self.getDebugAccessRequest()
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * Get firmware version
    * 
    * LWM2M path: /1027//6
    * @return String api call
    */
    public func getFirmwareVersionRequest()
         -> ApiRequest<Void>{
        var path = "/1027//6"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: path
        )
    }

     /**
        * Get firmware version
        * 
        * LWM2M path: /1027//6
                * @return String api call
        */
        public func getFirmwareVersion()
             throws -> ApiResponse<String>{
            let request : ApiRequest<Void> = self.getFirmwareVersionRequest()
            let converter: TapConverterContainer<String> = self.converterProvider.get(id: "string_version")
            let response: ApiResponse<String> = try self.client.execute(request: request, converter: converter)

            return response
        }
    /**
    * Get max voltage
    * 
    * LWM2M path: /1027//9
    * @return UInt16 api call
    */
    public func getMaxVoltageRequest()
         -> ApiRequest<Void>{
        var path = "/1027//9"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: path
        )
    }

     /**
        * Get max voltage
        * 
        * LWM2M path: /1027//9
                * @return UInt16 api call
        */
        public func getMaxVoltage()
             throws -> ApiResponse<UInt16>{
            let request : ApiRequest<Void> = self.getMaxVoltageRequest()
            let converter: TapConverterContainer<UInt16> = self.converterProvider.get(id: "integer_uint16")
            let response: ApiResponse<UInt16> = try self.client.execute(request: request, converter: converter)

            return response
        }
    /**
    * Get min voltage
    * 
    * LWM2M path: /1027//8
    * @return UInt16 api call
    */
    public func getMinVoltageRequest()
         -> ApiRequest<Void>{
        var path = "/1027//8"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: path
        )
    }

     /**
        * Get min voltage
        * 
        * LWM2M path: /1027//8
                * @return UInt16 api call
        */
        public func getMinVoltage()
             throws -> ApiResponse<UInt16>{
            let request : ApiRequest<Void> = self.getMinVoltageRequest()
            let converter: TapConverterContainer<UInt16> = self.converterProvider.get(id: "integer_uint16")
            let response: ApiResponse<UInt16> = try self.client.execute(request: request, converter: converter)

            return response
        }
    /**
    * Get current sub protocol
    * 
    * LWM2M path: /1027//40
    * @return Bytes api call
    */
    public func getModbusSubProtocolRequest()
         -> ApiRequest<Void>{
        var path = "/1027//40"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: path
        )
    }

     /**
        * Get current sub protocol
        * 
        * LWM2M path: /1027//40
                * @return Bytes api call
        */
        public func getModbusSubProtocol()
             throws -> ApiResponse<Bytes>{
            let request : ApiRequest<Void> = self.getModbusSubProtocolRequest()
            let converter: TapConverterContainer<Bytes> = self.converterProvider.get(id: "Bytes")
            let response: ApiResponse<Bytes> = try self.client.execute(request: request, converter: converter)

            return response
        }
    /**
    * Get page size
    * Alignement page (TAR)
    * LWM2M path: /1027//10
    * @return UInt32 api call
    */
    public func getPageSizeRequest()
         -> ApiRequest<Void>{
        var path = "/1027//10"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: path
        )
    }

     /**
        * Get page size
        * Alignement page (TAR)
        * LWM2M path: /1027//10
                * @return UInt32 api call
        */
        public func getPageSize()
             throws -> ApiResponse<UInt32>{
            let request : ApiRequest<Void> = self.getPageSizeRequest()
            let converter: TapConverterContainer<UInt32> = self.converterProvider.get(id: "integer_uint32")
            let response: ApiResponse<UInt32> = try self.client.execute(request: request, converter: converter)

            return response
        }
    /**
    * Get target protocol
    * 
    * LWM2M path: /1027//1
    * @return TargetProtocol api call
    */
    public func getProtocolRequest()
         -> ApiRequest<Void>{
        var path = "/1027//1"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: path
        )
    }

     /**
        * Get target protocol
        * 
        * LWM2M path: /1027//1
                * @return TargetProtocol api call
        */
        public func getProtocol()
             throws -> ApiResponse<TargetProtocol>{
            let request : ApiRequest<Void> = self.getProtocolRequest()
            let converter: TapConverterContainer<TargetProtocol> = self.converterProvider.get(id: "TargetProtocol")
            let response: ApiResponse<TargetProtocol> = try self.client.execute(request: request, converter: converter)

            return response
        }
    /**
    * List available target protocols
    * 
    * LWM2M path: /1027//20
    * @return ListTargetProtocol api call
    */
    public func getProtocolListRequest()
         -> ApiRequest<Void>{
        var path = "/1027//20"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: path
        )
    }

     /**
        * List available target protocols
        * 
        * LWM2M path: /1027//20
                * @return ListTargetProtocol api call
        */
        public func getProtocolList()
             throws -> ApiResponse<ListTargetProtocol>{
            let request : ApiRequest<Void> = self.getProtocolListRequest()
            let converter: TapConverterContainer<ListTargetProtocol> = self.converterProvider.get(id: "ListTargetProtocol")
            let response: ApiResponse<ListTargetProtocol> = try self.client.execute(request: request, converter: converter)

            return response
        }
    /**
    * Register access
    * Access registres (Cortex&#x3D;&gt;R0...R15) de la cible.  Accès conditionné par les ACLs du Bundle Debug (-2)
    * LWM2M path: /1027//32
    * @return  api call
    */
    public func getRegAccessRequest()
         -> ApiRequest<Void>{
        var path = "/1027//32"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: path
        )
    }

     /**
        * Register access
        * Access registres (Cortex&#x3D;&gt;R0...R15) de la cible.  Accès conditionné par les ACLs du Bundle Debug (-2)
        * LWM2M path: /1027//32
                * @return  api call
        */
        public func getRegAccess()
             throws -> ApiResponse<Void>{
            let request : ApiRequest<Void> = self.getRegAccessRequest()
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * Données de config du protocole (baudrate MODBus, chainage JTAG, etc.) Taille variable, fixée au premier write après le reset factory. 
    * 
    * LWM2M path: /1027//21
    * @return UartSettings api call
    */
    public func getUARTSettingsRequest()
         -> ApiRequest<Void>{
        var path = "/1027//21"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: path
        )
    }

     /**
        * Données de config du protocole (baudrate MODBus, chainage JTAG, etc.) Taille variable, fixée au premier write après le reset factory. 
        * 
        * LWM2M path: /1027//21
                * @return UartSettings api call
        */
        public func getUARTSettings()
             throws -> ApiResponse<UartSettings>{
            let request : ApiRequest<Void> = self.getUARTSettingsRequest()
            let converter: TapConverterContainer<UartSettings> = self.converterProvider.get(id: "UartSettings")
            let response: ApiResponse<UartSettings> = try self.client.execute(request: request, converter: converter)

            return response
        }
    /**
    * Get vcc
    * Lit la valeur de la tension de la cible
    * LWM2M path: /1027//7
    * @return UInt16 api call
    */
    public func getVccRequest()
         -> ApiRequest<Void>{
        var path = "/1027//7"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: path
        )
    }

     /**
        * Get vcc
        * Lit la valeur de la tension de la cible
        * LWM2M path: /1027//7
                * @return UInt16 api call
        */
        public func getVcc()
             throws -> ApiResponse<UInt16>{
            let request : ApiRequest<Void> = self.getVccRequest()
            let converter: TapConverterContainer<UInt16> = self.converterProvider.get(id: "integer_uint16")
            let response: ApiResponse<UInt16> = try self.client.execute(request: request, converter: converter)

            return response
        }
    /**
    * Generic modbus read
    * 
    * LWM2M path: /1027//38
    * Body converter id: "MemoryInfo"

    * @param data input
    * @return Bytes api call
    */
    public func modbusReadRequest(
        data: MemoryInfo
    ) -> ApiRequest<MemoryInfo>{
        var path = "/1027//38"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: path
            , body: data
            , bodyEncoder: self.converterProvider.get(id: "MemoryInfo")
        )
    }

     /**
        * Generic modbus read
        * 
        * LWM2M path: /1027//38
        * Body converter id: "MemoryInfo"
    
        * @param data input
        * @return Bytes api call
        */
        public func modbusRead(
            data: MemoryInfo
        ) throws -> ApiResponse<Bytes>{
            let request : ApiRequest<MemoryInfo> = self.modbusReadRequest(data: data)
            let converter: TapConverterContainer<Bytes> = self.converterProvider.get(id: "Bytes")
            let response: ApiResponse<Bytes> = try self.client.execute(request: request, converter: converter)

            return response
        }
    /**
    * Generic modbus write
    * 
    * LWM2M path: /1027//37
    * Body converter id: "MemoryWriteInfo"

    * @param data input
    * @return  api call
    */
    public func modbusWriteRequest(
        data: MemoryWriteInfo
    ) -> ApiRequest<MemoryWriteInfo>{
        var path = "/1027//37"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: path
            , body: data
            , bodyEncoder: self.converterProvider.get(id: "MemoryWriteInfo")
        )
    }

     /**
        * Generic modbus write
        * 
        * LWM2M path: /1027//37
        * Body converter id: "MemoryWriteInfo"
    
        * @param data input
        * @return  api call
        */
        public func modbusWrite(
            data: MemoryWriteInfo
        ) throws -> ApiResponse<Void>{
            let request : ApiRequest<MemoryWriteInfo> = self.modbusWriteRequest(data: data)
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * Perform actions to ADP target.
    * 
    * LWM2M path: /1027//39
    * Body converter id: "Bytes"

    * @param data input
    * @return  api call
    */
    public func postAdpActionRequest(
        data: Bytes
    ) -> ApiRequest<Bytes>{
        var path = "/1027//39"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.POST
            , path: path
            , body: data
            , bodyEncoder: self.converterProvider.get(id: "Bytes")
        )
    }

     /**
        * Perform actions to ADP target.
        * 
        * LWM2M path: /1027//39
        * Body converter id: "Bytes"
    
        * @param data input
        * @return  api call
        */
        public func postAdpAction(
            data: Bytes
        ) throws -> ApiResponse<Void>{
            let request : ApiRequest<Bytes> = self.postAdpActionRequest(data: data)
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * ???
    * 
    * LWM2M path: /1027//31
    * @return  api call
    */
    public func postDebugAccessRequest()
         -> ApiRequest<Void>{
        var path = "/1027//31"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.POST
            , path: path
        )
    }

     /**
        * ???
        * 
        * LWM2M path: /1027//31
                * @return  api call
        */
        public func postDebugAccess()
             throws -> ApiResponse<Void>{
            let request : ApiRequest<Void> = self.postDebugAccessRequest()
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * Set current sub protocol
    * 
    * LWM2M path: /1027//40
    * Body converter id: "Bytes"

    * @param data input
    * @return  api call
    */
    public func postModbusSubProtocolRequest(
        data: Bytes
    ) -> ApiRequest<Bytes>{
        var path = "/1027//40"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.POST
            , path: path
            , body: data
            , bodyEncoder: self.converterProvider.get(id: "Bytes")
        )
    }

     /**
        * Set current sub protocol
        * 
        * LWM2M path: /1027//40
        * Body converter id: "Bytes"
    
        * @param data input
        * @return  api call
        */
        public func postModbusSubProtocol(
            data: Bytes
        ) throws -> ApiResponse<Void>{
            let request : ApiRequest<Bytes> = self.postModbusSubProtocolRequest(data: data)
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * ???
    * 
    * LWM2M path: /1027//32
    * @return  api call
    */
    public func postRegAccessRequest()
         -> ApiRequest<Void>{
        var path = "/1027//32"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.POST
            , path: path
        )
    }

     /**
        * ???
        * 
        * LWM2M path: /1027//32
                * @return  api call
        */
        public func postRegAccess()
             throws -> ApiResponse<Void>{
            let request : ApiRequest<Void> = self.postRegAccessRequest()
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * Reset target
    * Reset de la cible (RST&#x3D;0) et maintient en Reset. Le relachement se fait par Reset (plus haut). Accès conditionné par les ACLs du Bundle réservé Debug (-2) si il existe, sinon Admin seulement
    * LWM2M path: /1027//30
    * @return  api call
    */
    public func postResetKeepRequest()
         -> ApiRequest<Void>{
        var path = "/1027//30"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.POST
            , path: path
        )
    }

     /**
        * Reset target
        * Reset de la cible (RST&#x3D;0) et maintient en Reset. Le relachement se fait par Reset (plus haut). Accès conditionné par les ACLs du Bundle réservé Debug (-2) si il existe, sinon Admin seulement
        * LWM2M path: /1027//30
                * @return  api call
        */
        public func postResetKeep()
             throws -> ApiResponse<Void>{
            let request : ApiRequest<Void> = self.postResetKeepRequest()
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * Write core type
    * 
    * LWM2M path: /1027//2
    * Body converter id: "TargetCoreType"

    * @param value input
    * @return  api call
    */
    public func putCoreTypeRequest(
        value: TargetCoreType
    ) -> ApiRequest<TargetCoreType>{
        var path = "/1027//2"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: path
            , body: value
            , bodyEncoder: self.converterProvider.get(id: "TargetCoreType")
        )
    }

     /**
        * Write core type
        * 
        * LWM2M path: /1027//2
        * Body converter id: "TargetCoreType"
    
        * @param value input
        * @return  api call
        */
        public func putCoreType(
            value: TargetCoreType
        ) throws -> ApiResponse<Void>{
            let request : ApiRequest<TargetCoreType> = self.putCoreTypeRequest(value: value)
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * Write firmware version
    * 
    * LWM2M path: /1027//6
    * Body converter id: "integer_uint32"

    * @param value input
    * @return  api call
    */
    public func putFirmwareVersionRequest(
        value: UInt32
    ) -> ApiRequest<UInt32>{
        var path = "/1027//6"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: path
            , body: value
            , bodyEncoder: self.converterProvider.get(id: "integer_uint32")
        )
    }

     /**
        * Write firmware version
        * 
        * LWM2M path: /1027//6
        * Body converter id: "integer_uint32"
    
        * @param value input
        * @return  api call
        */
        public func putFirmwareVersion(
            value: UInt32
        ) throws -> ApiResponse<Void>{
            let request : ApiRequest<UInt32> = self.putFirmwareVersionRequest(value: value)
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * Write max voltage value
    * 
    * LWM2M path: /1027//9
    * Body converter id: "integer_uint16"

    * @param value input
    * @return  api call
    */
    public func putMaxVoltageRequest(
        value: UInt16
    ) -> ApiRequest<UInt16>{
        var path = "/1027//9"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: path
            , body: value
            , bodyEncoder: self.converterProvider.get(id: "integer_uint16")
        )
    }

     /**
        * Write max voltage value
        * 
        * LWM2M path: /1027//9
        * Body converter id: "integer_uint16"
    
        * @param value input
        * @return  api call
        */
        public func putMaxVoltage(
            value: UInt16
        ) throws -> ApiResponse<Void>{
            let request : ApiRequest<UInt16> = self.putMaxVoltageRequest(value: value)
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * Write min voltage value
    * 
    * LWM2M path: /1027//8
    * Body converter id: "integer_uint16"

    * @param value input
    * @return  api call
    */
    public func putMinVoltageRequest(
        value: UInt16
    ) -> ApiRequest<UInt16>{
        var path = "/1027//8"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: path
            , body: value
            , bodyEncoder: self.converterProvider.get(id: "integer_uint16")
        )
    }

     /**
        * Write min voltage value
        * 
        * LWM2M path: /1027//8
        * Body converter id: "integer_uint16"
    
        * @param value input
        * @return  api call
        */
        public func putMinVoltage(
            value: UInt16
        ) throws -> ApiResponse<Void>{
            let request : ApiRequest<UInt16> = self.putMinVoltageRequest(value: value)
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * Write page size
    * 
    * LWM2M path: /1027//10
    * Body converter id: "integer_uint32"

    * @param value input
    * @return  api call
    */
    public func putPageSizeRequest(
        value: UInt32
    ) -> ApiRequest<UInt32>{
        var path = "/1027//10"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: path
            , body: value
            , bodyEncoder: self.converterProvider.get(id: "integer_uint32")
        )
    }

     /**
        * Write page size
        * 
        * LWM2M path: /1027//10
        * Body converter id: "integer_uint32"
    
        * @param value input
        * @return  api call
        */
        public func putPageSize(
            value: UInt32
        ) throws -> ApiResponse<Void>{
            let request : ApiRequest<UInt32> = self.putPageSizeRequest(value: value)
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * Write target protocol
    * 
    * LWM2M path: /1027//1
    * Body converter id: "TargetProtocol"

    * @param targetProtocol input
    * @return  api call
    */
    public func putProtocolRequest(
        targetProtocol: TargetProtocol
    ) -> ApiRequest<TargetProtocol>{
        var path = "/1027//1"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: path
            , body: targetProtocol
            , bodyEncoder: self.converterProvider.get(id: "TargetProtocol")
        )
    }

     /**
        * Write target protocol
        * 
        * LWM2M path: /1027//1
        * Body converter id: "TargetProtocol"
    
        * @param targetProtocol input
        * @return  api call
        */
        public func putProtocol(
            targetProtocol: TargetProtocol
        ) throws -> ApiResponse<Void>{
            let request : ApiRequest<TargetProtocol> = self.putProtocolRequest(targetProtocol: targetProtocol)
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * Read memory at given address on the target application
    * 
    * LWM2M path: /1027//33
    * Body converter id: "MemoryInfo"

    * @param value input
    * @return Bytes api call
    */
    public func readAddressRequest(
        value: MemoryInfo
    ) -> ApiRequest<MemoryInfo>{
        var path = "/1027//33"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: path
            , body: value
            , bodyEncoder: self.converterProvider.get(id: "MemoryInfo")
        )
    }

     /**
        * Read memory at given address on the target application
        * 
        * LWM2M path: /1027//33
        * Body converter id: "MemoryInfo"
    
        * @param value input
        * @return Bytes api call
        */
        public func readAddress(
            value: MemoryInfo
        ) throws -> ApiResponse<Bytes>{
            let request : ApiRequest<MemoryInfo> = self.readAddressRequest(value: value)
            let converter: TapConverterContainer<Bytes> = self.converterProvider.get(id: "Bytes")
            let response: ApiResponse<Bytes> = try self.client.execute(request: request, converter: converter)

            return response
        }
    /**
    * Read data transparent mode with limit
    * Lecture de données de la target en mode transparent ou semi-transparent   si il y en a, sans attente.
    * LWM2M path: /1027//35
    * Body converter id: "integer_uint32"

    * @param nbBytes input
    * @return Bytes api call
    */
    public func readBytesRequest(
        nbBytes: UInt32? = nil
    ) -> ApiRequest<UInt32>{
        var path = "/1027//35"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: path
            , body: nbBytes
            , bodyEncoder: self.converterProvider.get(id: "integer_uint32")
        )
    }

     /**
        * Read data transparent mode with limit
        * Lecture de données de la target en mode transparent ou semi-transparent   si il y en a, sans attente.
        * LWM2M path: /1027//35
        * Body converter id: "integer_uint32"
    
        * @param nbBytes input
        * @return Bytes api call
        */
        public func readBytes(
            nbBytes: UInt32? = nil
        ) throws -> ApiResponse<Bytes>{
            let request : ApiRequest<UInt32> = self.readBytesRequest(nbBytes: nbBytes)
            let converter: TapConverterContainer<Bytes> = self.converterProvider.get(id: "Bytes")
            let response: ApiResponse<Bytes> = try self.client.execute(request: request, converter: converter)

            return response
        }
    /**
    * Reset target
    * Reset de la cible. (Reset &#x3D;0, wait, Reset &#x3D; 1) utilisé pour relacher le reset après utilisation de ResetKeep.  Accès conditionné par les ACLs du Bundle Debug (-2)
    * LWM2M path: /1027//5
    * @return  api call
    */
    public func resetRequest()
         -> ApiRequest<Void>{
        var path = "/1027//5"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.POST
            , path: path
        )
    }

     /**
        * Reset target
        * Reset de la cible. (Reset &#x3D;0, wait, Reset &#x3D; 1) utilisé pour relacher le reset après utilisation de ResetKeep.  Accès conditionné par les ACLs du Bundle Debug (-2)
        * LWM2M path: /1027//5
                * @return  api call
        */
        public func reset()
             throws -> ApiResponse<Void>{
            let request : ApiRequest<Void> = self.resetRequest()
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * Transparent send
    * Send data to the target application
    * LWM2M path: /1027//34
    * Body converter id: "Bytes"

    * @param data input
    * @return Bytes api call
    */
    public func sendRequest(
        data: Bytes
    ) -> ApiRequest<Bytes>{
        var path = "/1027//34"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.POST
            , path: path
            , body: data
            , bodyEncoder: self.converterProvider.get(id: "Bytes")
        )
    }

     /**
        * Transparent send
        * Send data to the target application
        * LWM2M path: /1027//34
        * Body converter id: "Bytes"
    
        * @param data input
        * @return Bytes api call
        */
        public func send(
            data: Bytes
        ) throws -> ApiResponse<Bytes>{
            let request : ApiRequest<Bytes> = self.sendRequest(data: data)
            let converter: TapConverterContainer<Bytes> = self.converterProvider.get(id: "Bytes")
            let response: ApiResponse<Bytes> = try self.client.execute(request: request, converter: converter)

            return response
        }
    /**
    * Transparent send and receive
    * Send data to the target application and expect response length
    * LWM2M path: /1027//34
    * Body converter id: "Bytes"

    * @param data input
    * @return Bytes api call
    */
    public func sendReceiveRequest(
        data: Bytes
    ) -> ApiRequest<Bytes>{
        var path = "/1027//34"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: path
            , body: data
            , bodyEncoder: self.converterProvider.get(id: "Bytes")
        )
    }

     /**
        * Transparent send and receive
        * Send data to the target application and expect response length
        * LWM2M path: /1027//34
        * Body converter id: "Bytes"
    
        * @param data input
        * @return Bytes api call
        */
        public func sendReceive(
            data: Bytes
        ) throws -> ApiResponse<Bytes>{
            let request : ApiRequest<Bytes> = self.sendReceiveRequest(data: data)
            let converter: TapConverterContainer<Bytes> = self.converterProvider.get(id: "Bytes")
            let response: ApiResponse<Bytes> = try self.client.execute(request: request, converter: converter)

            return response
        }
    /**
    * Temporary update configuration
    * Execute permet de changer la valeur (mais pas la taille) courante de manière temporaire. Elle sera réinitialisée au reset d&#39;après la valeur configurée.
    * LWM2M path: /1027//21
    * Body converter id: "UartSettings"

    * @param value input
    * @return  api call
    */
    public func setUARTSettingsRequest(
        value: UartSettings
    ) -> ApiRequest<UartSettings>{
        var path = "/1027//21"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.POST
            , path: path
            , body: value
            , bodyEncoder: self.converterProvider.get(id: "UartSettings")
        )
    }

     /**
        * Temporary update configuration
        * Execute permet de changer la valeur (mais pas la taille) courante de manière temporaire. Elle sera réinitialisée au reset d&#39;après la valeur configurée.
        * LWM2M path: /1027//21
        * Body converter id: "UartSettings"
    
        * @param value input
        * @return  api call
        */
        public func setUARTSettings(
            value: UartSettings
        ) throws -> ApiResponse<Void>{
            let request : ApiRequest<UartSettings> = self.setUARTSettingsRequest(value: value)
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * Write into memory on target
    * 
    * LWM2M path: /1027//33
    * Body converter id: "MemoryWriteInfo"

    * @param value input
    * @return  api call
    */
    public func writeAddressRequest(
        value: MemoryWriteInfo
    ) -> ApiRequest<MemoryWriteInfo>{
        var path = "/1027//33"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.POST
            , path: path
            , body: value
            , bodyEncoder: self.converterProvider.get(id: "MemoryWriteInfo")
        )
    }

     /**
        * Write into memory on target
        * 
        * LWM2M path: /1027//33
        * Body converter id: "MemoryWriteInfo"
    
        * @param value input
        * @return  api call
        */
        public func writeAddress(
            value: MemoryWriteInfo
        ) throws -> ApiResponse<Void>{
            let request : ApiRequest<MemoryWriteInfo> = self.writeAddressRequest(value: value)
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * Update configuration
    * Put permet de changer la valeur (mais pas la taille) courante de manière permanente
    * LWM2M path: /1027//21
    * Body converter id: "UartSettings"

    * @param value input
    * @return  api call
    */
    public func writeUARTSettingsRequest(
        value: UartSettings
    ) -> ApiRequest<UartSettings>{
        var path = "/1027//21"
        //var regex = "\{([\S]*)\}"
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: path
            , body: value
            , bodyEncoder: self.converterProvider.get(id: "UartSettings")
        )
    }

     /**
        * Update configuration
        * Put permet de changer la valeur (mais pas la taille) courante de manière permanente
        * LWM2M path: /1027//21
        * Body converter id: "UartSettings"
    
        * @param value input
        * @return  api call
        */
        public func writeUARTSettings(
            value: UartSettings
        ) throws -> ApiResponse<Void>{
            let request : ApiRequest<UartSettings> = self.writeUARTSettingsRequest(value: value)
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }

}
