//
// GroupAPI.swift
//
// Generated by iotize device api codegen
//

import Foundation
import TapClientApi
// 



open class GroupAPI {

    var client: TapClient
    var converterProvider: ConverterProvider

    init(client: TapClient, converterProvider: ConverterProvider){
        self.client = client
        self.converterProvider = converterProvider
    }

    /**
    * Get group alias
    * ID du groupe dont ce groupe hérite les droits. Si l&#39;Alias correspond à l&#39;ID du groupe, alors c&#39;est un Profile, sinon c&#39;est un User.
    * LWM2M path: /1025/{groupId}/5

    * @param groupId input
    * @return Int api call
    */
    public func getAliasRequest(
        groupId: Int
    ) -> ApiRequest<Void>{
        var path = "/1025/{groupId}/5"
        //var regex = "\{([\S]*)\}"
        
        path = path.replacingOccurrences(of: "{"+"groupId"+"}", with: String(groupId))
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: path
            
        )
    }

     /**
        * Get group alias
        * ID du groupe dont ce groupe hérite les droits. Si l&#39;Alias correspond à l&#39;ID du groupe, alors c&#39;est un Profile, sinon c&#39;est un User.
        * LWM2M path: /1025/{groupId}/5
        
        * @param groupId input
        * @return Int api call
        */
        public func getAlias(
            groupId: Int
        ) throws -> ApiResponse<Int>{
            let request : ApiRequest<Void> = self.getAliasRequest(groupId: groupId)
            let converter: TapConverterContainer<Int> = self.converterProvider.get(id: "integer_uint16")
            let response: ApiResponse<Int> = try self.client.execute(request: request, converter: converter)

            return response
        }
    /**
    * Get the name of the group
    * 
    * LWM2M path: /1025/{groupId}/0

    * @param groupId input
    * @return String api call
    */
    public func getNameRequest(
        groupId: Int
    ) -> ApiRequest<Void>{
        var path = "/1025/{groupId}/0"
        //var regex = "\{([\S]*)\}"
        
        path = path.replacingOccurrences(of: "{"+"groupId"+"}", with: String(groupId))
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: path
            
        )
    }

     /**
        * Get the name of the group
        * 
        * LWM2M path: /1025/{groupId}/0
        
        * @param groupId input
        * @return String api call
        */
        public func getName(
            groupId: Int
        ) throws -> ApiResponse<String>{
            let request : ApiRequest<Void> = self.getNameRequest(groupId: groupId)
            let converter: TapConverterContainer<String> = self.converterProvider.get(id: "string")
            let response: ApiResponse<String> = try self.client.execute(request: request, converter: converter)

            return response
        }
    /**
    * Get scram user iteration
    * SCRAM Hash Iteration: Nombre d&#39;itérations utilisé en SCRAM pour le dernier hashage. Nombre &gt;1000, généré aléatoirement à l&#39;écriture de la conf dans l&#39;IoTize.
    * LWM2M path: /1025/{groupId}/7

    * @param groupId input
    * @return Int api call
    */
    public func getScramUserIterationRequest(
        groupId: Int
    ) -> ApiRequest<Void>{
        var path = "/1025/{groupId}/7"
        //var regex = "\{([\S]*)\}"
        
        path = path.replacingOccurrences(of: "{"+"groupId"+"}", with: String(groupId))
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: path
            
        )
    }

     /**
        * Get scram user iteration
        * SCRAM Hash Iteration: Nombre d&#39;itérations utilisé en SCRAM pour le dernier hashage. Nombre &gt;1000, généré aléatoirement à l&#39;écriture de la conf dans l&#39;IoTize.
        * LWM2M path: /1025/{groupId}/7
        
        * @param groupId input
        * @return Int api call
        */
        public func getScramUserIteration(
            groupId: Int
        ) throws -> ApiResponse<Int>{
            let request : ApiRequest<Void> = self.getScramUserIterationRequest(groupId: groupId)
            let converter: TapConverterContainer<Int> = self.converterProvider.get(id: "integer_uint32")
            let response: ApiResponse<Int> = try self.client.execute(request: request, converter: converter)

            return response
        }
    /**
    * Get scram user salt
    * User-specific salt utilisé (avec le User Name) pour saller les hashs du password StoredKey et ServerKey. Ecrit par Exec/SetPWD
    * LWM2M path: /1025/{groupId}/16

    * @param groupId input
    * @return Int api call
    */
    public func getScramUserSaltRequest(
        groupId: Int
    ) -> ApiRequest<Void>{
        var path = "/1025/{groupId}/16"
        //var regex = "\{([\S]*)\}"
        
        path = path.replacingOccurrences(of: "{"+"groupId"+"}", with: String(groupId))
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: path
            
        )
    }

     /**
        * Get scram user salt
        * User-specific salt utilisé (avec le User Name) pour saller les hashs du password StoredKey et ServerKey. Ecrit par Exec/SetPWD
        * LWM2M path: /1025/{groupId}/16
        
        * @param groupId input
        * @return Int api call
        */
        public func getScramUserSalt(
            groupId: Int
        ) throws -> ApiResponse<Int>{
            let request : ApiRequest<Void> = self.getScramUserSaltRequest(groupId: groupId)
            let converter: TapConverterContainer<Int> = self.converterProvider.get(id: "integer_uint32")
            let response: ApiResponse<Int> = try self.client.execute(request: request, converter: converter)

            return response
        }
    /**
    * Get the maximum session lifetime
    * 
    * LWM2M path: /1025/{groupId}/4

    * @param groupId input
    * @return Int api call
    */
    public func getSessionLifetimeRequest(
        groupId: Int
    ) -> ApiRequest<Void>{
        var path = "/1025/{groupId}/4"
        //var regex = "\{([\S]*)\}"
        
        path = path.replacingOccurrences(of: "{"+"groupId"+"}", with: String(groupId))
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: path
            
        )
    }

     /**
        * Get the maximum session lifetime
        * 
        * LWM2M path: /1025/{groupId}/4
        
        * @param groupId input
        * @return Int api call
        */
        public func getSessionLifetime(
            groupId: Int
        ) throws -> ApiResponse<Int>{
            let request : ApiRequest<Void> = self.getSessionLifetimeRequest(groupId: groupId)
            let converter: TapConverterContainer<Int> = self.converterProvider.get(id: "integer_uint16")
            let response: ApiResponse<Int> = try self.client.execute(request: request, converter: converter)

            return response
        }
    /**
    * Update password
    * Demande de modification du Pwd, arguments :* pwd (16 chars) in no security or 1-hash modes.* StoredKey+ServerKey+UserSalt+UserIt (40 uchar) in SCRAM multi-hash mode
    * LWM2M path: /1025/{groupId}/2
    * Body converter id: "string"

    * @param groupId input

    * @param password input
    * @return  api call
    */
    public func postPasswordRequest(
        groupId: Int, password: String
    ) -> ApiRequest<String>{
        var path = "/1025/{groupId}/2"
        //var regex = "\{([\S]*)\}"
        
        path = path.replacingOccurrences(of: "{"+"groupId"+"}", with: String(groupId))
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.POST
            , path: path
            
            , body: password
            , bodyEncoder: self.converterProvider.get(id: "string")
        )
    }

     /**
        * Update password
        * Demande de modification du Pwd, arguments :* pwd (16 chars) in no security or 1-hash modes.* StoredKey+ServerKey+UserSalt+UserIt (40 uchar) in SCRAM multi-hash mode
        * LWM2M path: /1025/{groupId}/2
        * Body converter id: "string"
    
        * @param groupId input

        * @param password input
        * @return  api call
        */
        public func postPassword(
            groupId: Int, password: String
        ) throws -> ApiResponse<Void>{
            let request : ApiRequest<String> = self.postPasswordRequest(groupId: groupId, password: password)
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * Write group alias
    * 
    * LWM2M path: /1025/{groupId}/5
    * Body converter id: "integer_uint16"

    * @param groupId input

    * @param value input
    * @return  api call
    */
    public func putAliasRequest(
        groupId: Int, value: Int
    ) -> ApiRequest<Int>{
        var path = "/1025/{groupId}/5"
        //var regex = "\{([\S]*)\}"
        
        path = path.replacingOccurrences(of: "{"+"groupId"+"}", with: String(groupId))
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: path
            
            , body: value
            , bodyEncoder: self.converterProvider.get(id: "integer_uint16")
        )
    }

     /**
        * Write group alias
        * 
        * LWM2M path: /1025/{groupId}/5
        * Body converter id: "integer_uint16"
    
        * @param groupId input

        * @param value input
        * @return  api call
        */
        public func putAlias(
            groupId: Int, value: Int
        ) throws -> ApiResponse<Void>{
            let request : ApiRequest<Int> = self.putAliasRequest(groupId: groupId, value: value)
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * Write group name
    * 
    * LWM2M path: /1025/{groupId}/0
    * Body converter id: "string"

    * @param groupId input

    * @param name input
    * @return  api call
    */
    public func putNameRequest(
        groupId: Int, name: String
    ) -> ApiRequest<String>{
        var path = "/1025/{groupId}/0"
        //var regex = "\{([\S]*)\}"
        
        path = path.replacingOccurrences(of: "{"+"groupId"+"}", with: String(groupId))
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: path
            
            , body: name
            , bodyEncoder: self.converterProvider.get(id: "string")
        )
    }

     /**
        * Write group name
        * 
        * LWM2M path: /1025/{groupId}/0
        * Body converter id: "string"
    
        * @param groupId input

        * @param name input
        * @return  api call
        */
        public func putName(
            groupId: Int, name: String
        ) throws -> ApiResponse<Void>{
            let request : ApiRequest<String> = self.putNameRequest(groupId: groupId, name: name)
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * Write scram user iteration
    * 
    * LWM2M path: /1025/{groupId}/7
    * Body converter id: "integer_uint32"

    * @param groupId input

    * @param value input
    * @return  api call
    */
    public func putScramUserIterationRequest(
        groupId: Int, value: Int
    ) -> ApiRequest<Int>{
        var path = "/1025/{groupId}/7"
        //var regex = "\{([\S]*)\}"
        
        path = path.replacingOccurrences(of: "{"+"groupId"+"}", with: String(groupId))
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: path
            
            , body: value
            , bodyEncoder: self.converterProvider.get(id: "integer_uint32")
        )
    }

     /**
        * Write scram user iteration
        * 
        * LWM2M path: /1025/{groupId}/7
        * Body converter id: "integer_uint32"
    
        * @param groupId input

        * @param value input
        * @return  api call
        */
        public func putScramUserIteration(
            groupId: Int, value: Int
        ) throws -> ApiResponse<Void>{
            let request : ApiRequest<Int> = self.putScramUserIterationRequest(groupId: groupId, value: value)
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * Write scram user salt
    * 
    * LWM2M path: /1025/{groupId}/16
    * Body converter id: "integer_uint32"

    * @param groupId input

    * @param value input
    * @return  api call
    */
    public func putScramUserSaltRequest(
        groupId: Int, value: Int
    ) -> ApiRequest<Int>{
        var path = "/1025/{groupId}/16"
        //var regex = "\{([\S]*)\}"
        
        path = path.replacingOccurrences(of: "{"+"groupId"+"}", with: String(groupId))
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: path
            
            , body: value
            , bodyEncoder: self.converterProvider.get(id: "integer_uint32")
        )
    }

     /**
        * Write scram user salt
        * 
        * LWM2M path: /1025/{groupId}/16
        * Body converter id: "integer_uint32"
    
        * @param groupId input

        * @param value input
        * @return  api call
        */
        public func putScramUserSalt(
            groupId: Int, value: Int
        ) throws -> ApiResponse<Void>{
            let request : ApiRequest<Int> = self.putScramUserSaltRequest(groupId: groupId, value: value)
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }
    /**
    * Write session lifetime
    * 
    * LWM2M path: /1025/{groupId}/4
    * Body converter id: "integer_uint16"

    * @param groupId input

    * @param value input
    * @return  api call
    */
    public func putSessionLifetimeRequest(
        groupId: Int, value: Int
    ) -> ApiRequest<Int>{
        var path = "/1025/{groupId}/4"
        //var regex = "\{([\S]*)\}"
        
        path = path.replacingOccurrences(of: "{"+"groupId"+"}", with: String(groupId))
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: path
            
            , body: value
            , bodyEncoder: self.converterProvider.get(id: "integer_uint16")
        )
    }

     /**
        * Write session lifetime
        * 
        * LWM2M path: /1025/{groupId}/4
        * Body converter id: "integer_uint16"
    
        * @param groupId input

        * @param value input
        * @return  api call
        */
        public func putSessionLifetime(
            groupId: Int, value: Int
        ) throws -> ApiResponse<Void>{
            let request : ApiRequest<Int> = self.putSessionLifetimeRequest(groupId: groupId, value: value)
            
            let response: ApiResponse<Void> = try self.client.execute(request: request)

            return response
        }

}