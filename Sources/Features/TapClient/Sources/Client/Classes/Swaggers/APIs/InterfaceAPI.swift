//
// InterfaceAPI.swift
//
// Generated by iotize device api codegen
//

import Foundation
// 



open class InterfaceAPI {


    /**
    * Get application name
    * 
    * LWM2M path: /1024//9
    * @return String api call
    */
    public func getAppName()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/app-name"
        )
    }
    /**
    * Get app path
    * Application Android à lancer ou page HTML à afficher quand l&#39;IoTize est détecté par le téléphone
    * LWM2M path: /1024//11
    * @return String api call
    */
    public func getAppPath()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/app-path"
        )
    }
    /**
    * Get authorized host protocols
    * 
    * LWM2M path: /1024//17
    * @return ListHostProtocol api call
    */
    public func getAuthorizedHostProtocol()
         -> ApiRequest<ListHostProtocol>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/authorized-host-protocol"
        )
    }
    /**
    * Get available host protocols
    * 
    * LWM2M path: /1024//21
    * @return ListHostProtocol api call
    */
    public func getAvailableHostProtocols()
         -> ApiRequest<ListHostProtocol>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/available-host-protocols"
        )
    }
    /**
    * Get ble address
    * 
    * LWM2M path: /1024//22
    * @return String api call
    */
    public func getBleAddress()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/ble/address"
        )
    }
    /**
    * Get cloud client id
    * 
    * LWM2M path: /3//2
    * @return String api call
    */
    public func getCloudClientId()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/cloud/client-id"
        )
    }
    /**
    * Get cloud connection mode
    * 
    * LWM2M path: /1024//26
    * @return CloudConnectionMode api call
    */
    public func getCloudConnectionMode()
         -> ApiRequest<CloudConnectionMode>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/cloud/connection-mode"
        )
    }
    /**
    * Get cloud gateway url
    * Adresse serveur Web du broker MQTT servant au Cloud. Pour envoyer le datalog par exemple. (Mais PAS pour le Relay MQTT)
    * LWM2M path: /1024//12
    * @return String api call
    */
    public func getCloudGatewayUrl()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/cloud-gateway-url"
        )
    }
    /**
    * Get cloud login id
    * 
    * LWM2M path: /3//2
    * @return String api call
    */
    public func getCloudLogin()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/cloud/login"
        )
    }
    /**
    * Get cloud mqtt period
    * Minimum period between 2 Mqtt smartphone sendings in ms : 0 &#x3D; no
    * LWM2M path: /1024//33
    * @return Int api call
    */
    public func getCloudMqttPeriod()
         -> ApiRequest<Int>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/cloud/mqtt-period"
        )
    }
    /**
    * Get cloud password
    * 
    * LWM2M path: /1024//29
    * @return String api call
    */
    public func getCloudPassword()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/cloud/password"
        )
    }
    /**
    * Get the cloud service name
    * 
    * LWM2M path: /1024//61
    * @return String api call
    */
    public func getCloudServiceName()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/cloud/service-name"
        )
    }
    /**
    * Crypted communication channel
    * 
    * LWM2M path: /1024//71
    * Body converter id: "Bytes"

    * @param data input
    * @return Bytes api call
    */
    public func getCom(
        data: Bytes
    ) -> ApiRequest<Bytes>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/secure-element/com"
            , body: data
        )
    }
    /**
    * Get config format firmware version
    * Version du Firmware qui a écrit la conf. (écrit automatiquement lors de la conf par le Firmware, pas depuis le fichier de conf)
    * LWM2M path: /1024//18
    * @return String api call
    */
    public func getConfigFormatFirmwareVersion()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/config-format-firmware-version"
        )
    }
    /**
    * Get config format version
    * 
    * LWM2M path: /1024//8
    * @return String api call
    */
    public func getConfigFormatVersion()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/config-format-version"
        )
    }
    /**
    * Get config version
    * 
    * LWM2M path: /1024//10
    * @return String api call
    */
    public func getConfigVersion()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/config-version"
        )
    }
    /**
    * Get configuration of Secure Element
    * 
    * LWM2M path: /1024//70
    * @return Bytes api call
    */
    public func getConfigure()
         -> ApiRequest<Bytes>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/secure-element/configure"
        )
    }
    /**
    * Get current group id 
    * 
    * LWM2M path: /1024//7
    * @return Int api call
    */
    public func getCurrentGroupId()
         -> ApiRequest<Int>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/current-group-id"
        )
    }
    /**
    * Get current host protocol
    * 
    * LWM2M path: /1024//3
    * @return HostProtocol api call
    */
    public func getCurrentHostProtocol()
         -> ApiRequest<HostProtocol>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/current-host-protocol"
        )
    }
    /**
    * Get current profile id
    * 
    * LWM2M path: /1024//2
    * @return Int api call
    */
    public func getCurrentProfileId()
         -> ApiRequest<Int>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/current-profile/id"
        )
    }
    /**
    * Get functions
    * Get functions
    * LWM2M path: /1024//20
    * @return AvailableFunction api call
    */
    public func getFunctions()
         -> ApiRequest<AvailableFunction>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/functions"
        )
    }
    /**
    * Get host inactivity period
    * Host inactivity period before switch to standby mode or shutdown depending on optimisation level (res /1024//14)
    * LWM2M path: /1024//34
    * @return Int api call
    */
    public func getHostInactivityPeriod()
         -> ApiRequest<Int>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/host-inactivity-period"
        )
    }
    /**
    * Get lock infos 
    * 
    * LWM2M path: /1024//6
    * @return InterfaceLock api call
    */
    public func getLock()
         -> ApiRequest<InterfaceLock>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/lock"
        )
    }
    /**
    * Get mqtt relay client id
    * 
    * LWM2M path: /3//2
    * @return String api call
    */
    public func getMqttRelayClientId()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/mqtt/relay/client-id"
        )
    }
    /**
    * Get mqtt relay login
    * 
    * LWM2M path: /3//2
    * @return String api call
    */
    public func getMqttRelayLogin()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/mqtt/relay/login"
        )
    }
    /**
    * Get the mqtt net key for the server
    * 
    * LWM2M path: /1024//55
    * @return String api call
    */
    public func getMqttRelayNetKey()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/mqtt/relay/net-key"
        )
    }
    /**
    * Get the mqtt relay password
    * Mot de passe connexion au broker
    * LWM2M path: /1024//54
    * @return String api call
    */
    public func getMqttRelayPassword()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/mqtt/relay/password"
        )
    }
    /**
    * Get port of the mqtt broker
    * 
    * LWM2M path: /1024//51
    * @return String api call
    */
    public func getMqttRelayPort()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/mqtt/relay/port"
        )
    }
    /**
    * Get mqtt relay url
    * 
    * LWM2M path: /1024//50
    * @return String api call
    */
    public func getMqttRelayUrl()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/mqtt/relay/url"
        )
    }
    /**
    * Get iotize gateway ip on the network
    * Adresse IP : ex 192.168.1.1. Seulement pour les IoTize Wifi. (vraiment ?)
    * LWM2M path: /1024//31
    * @return String api call
    */
    public func getNetworkGatewayIp()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/network/gateway-ip"
        )
    }
    /**
    * Get IoTize device ip on the network
    * Adresse statique IP : ex 192.168.1.10. DHCP si adresse &#x3D; 0.0.0.0. Seulement pour les IoTize Wifi.
    * LWM2M path: /1024//30
    * @return String api call
    */
    public func getNetworkInfraIp()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/network/infra-ip"
        )
    }
    /**
    * Get infrastructure ip mask
    * Mask IP : ex 255.255.255.0. Seulement pour les IoTize Wifi.
    * LWM2M path: /1024//32
    * @return String api call
    */
    public func getNetworkInfraIpMask()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/network/infra-ip-mask"
        )
    }
    /**
    * Get network mode
    * 
    * LWM2M path: /1024//15
    * @return NetworkMode api call
    */
    public func getNetworkMode()
         -> ApiRequest<NetworkMode>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/network-mode"
        )
    }
    /**
    * Check if nfc paring is mandatory
    * 
    * LWM2M path: /1024//13
    * @return NfcPairingMode api call
    */
    public func getNfcPairingMode()
         -> ApiRequest<NfcPairingMode>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/nfc/pairing-mode"
        )
    }
    /**
    * Get power optimization level
    * 
    * LWM2M path: /1024//14
    * @return LowPowerOptimisationLevel api call
    */
    public func getPowerOptimisationLevel()
         -> ApiRequest<LowPowerOptimisationLevel>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/power-optimisation-level"
        )
    }
    /**
    * Get the public password ?
    * Password utilisé pour l&#39;enregistrement. Également défaut du MQTT Relay PWD
    * LWM2M path: /1024//60
    * @return String api call
    */
    public func getPublicPassword()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/public-password"
        )
    }
    /**
    * Generate a random number
    * 
    * LWM2M path: /1024//49
    * @return Bytes api call
    */
    public func getRand()
         -> ApiRequest<Bytes>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/rand"
        )
    }
    /**
    * Get network key
    * Clé WAP / WEP pour connection réseau infrastructure &amp; P2P
    * LWM2M path: /1024//16
    * @return String api call
    */
    public func getWepKey()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/wep-key"
        )
    }
    /**
    * Get wifi hostname
    * Hostname par exemple, à lire par NFC pour connection socket à un IoTize Wifi en mode infrastructure avec DHCP
    * LWM2M path: /1024//35
    * @return String api call
    */
    public func getWifiHostname()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/wifi/hostname"
        )
    }
    /**
    * Get wifi ssid
    * May be null if not connected to any network
    * LWM2M path: /1024//25
    * @return String api call
    */
    public func getWifiSSID()
         -> ApiRequest<String>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/wifi/ssid"
        )
    }
    /**
    * Keep alive.
    * Call this method to ensure communication resources are maintain.
    * LWM2M path: /1024//4
    * @return Int api call
    */
    public func keepAlive()
         -> ApiRequest<Int>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/keep-alive"
        )
    }
    /**
    * Login
    * User login with username and password
    * LWM2M path: /1024//0
    * Body converter id: "LoginCredential"

    * @param credential input
    * @return  api call
    */
    public func login(
        credential: LoginCredential
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.POST
            , path: "/interface/login"
            , body: credential
        )
    }
    /**
    * Logout
    * 
    * LWM2M path: /1024//1
    * @return  api call
    */
    public func logout()
         -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.POST
            , path: "/interface/logout"
        )
    }
    /**
    * Execute multiple commands sent in one frame, and return all answers in one
    * 
    * LWM2M path: /1024//89
    * Body converter id: "MultiCommands"

    * @param data input
    * @return MultiResponses api call
    */
    public func multiCommands(
        data: MultiCommands
    ) -> ApiRequest<MultiResponses>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.GET
            , path: "/interface/multi-commands"
            , body: data
        )
    }
    /**
    * Admnistration login
    * Log in as an administrator thanks to the UID
    * LWM2M path: /1024//5
    * Body converter id: "Bytes"

    * @param uid input
    * @return  api call
    */
    public func postLoginUid(
        uid: Bytes
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.POST
            , path: "/interface/login-uid"
            , body: uid
        )
    }
    /**
    * Set application name
    * 
    * LWM2M path: /1024//9
    * Body converter id: "string"

    * @param appName input
    * @return  api call
    */
    public func putAppName(
        appName: String
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/app-name"
            , body: appName
        )
    }
    /**
    * Set app path
    * 
    * LWM2M path: /1024//11
    * Body converter id: "string"

    * @param version input
    * @return  api call
    */
    public func putAppPath(
        version: String
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/app-path"
            , body: version
        )
    }
    /**
    * Write authorized host protocols
    * 
    * LWM2M path: /1024//17
    * Body converter id: "ListHostProtocol"

    * @param mode input
    * @return  api call
    */
    public func putAuthorizedHostProtocol(
        mode: ListHostProtocol
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/authorized-host-protocol"
            , body: mode
        )
    }
    /**
    * Write cloud connection mode
    * 
    * LWM2M path: /1024//26
    * Body converter id: "CloudConnectionMode"

    * @param key input
    * @return  api call
    */
    public func putCloudConnectionMode(
        key: CloudConnectionMode
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/cloud/connection-mode"
            , body: key
        )
    }
    /**
    * Write cloud gateway url
    * 
    * LWM2M path: /1024//12
    * Body converter id: "string"

    * @param version input
    * @return  api call
    */
    public func putCloudGatewayUrl(
        version: String
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/cloud-gateway-url"
            , body: version
        )
    }
    /**
    * Write cloud mqtt period
    * 
    * LWM2M path: /1024//33
    * Body converter id: "integer_uint32"

    * @param key input
    * @return  api call
    */
    public func putCloudMqttPeriod(
        key: Int
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/cloud/mqtt-period"
            , body: key
        )
    }
    /**
    * Write cloud password
    * 
    * LWM2M path: /1024//29
    * Body converter id: "string"

    * @param key input
    * @return  api call
    */
    public func putCloudPassword(
        key: String
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/cloud/password"
            , body: key
        )
    }
    /**
    * Write cloud service name
    * 
    * LWM2M path: /1024//61
    * Body converter id: "string"

    * @param name input
    * @return  api call
    */
    public func putCloudServiceName(
        name: String
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/cloud/service-name"
            , body: name
        )
    }
    /**
    * Set config format version
    * 
    * LWM2M path: /1024//8
    * Body converter id: "integer_uint32"

    * @param configFormat input
    * @return  api call
    */
    public func putConfigFormatVersion(
        configFormat: Int
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/config-format-version"
            , body: configFormat
        )
    }
    /**
    * Set config version
    * 
    * LWM2M path: /1024//10
    * Body converter id: "integer_uint32"

    * @param version input
    * @return  api call
    */
    public func putConfigVersion(
        version: Int
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/config-version"
            , body: version
        )
    }
    /**
    * Write secure element configuration
    * 
    * LWM2M path: /1024//70
    * Body converter id: "Bytes"

    * @param conf input
    * @return  api call
    */
    public func putConfigure(
        conf: Bytes
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/secure-element/configure"
            , body: conf
        )
    }
    /**
    * Write current host protocol
    * 
    * LWM2M path: /1024//3
    * Body converter id: "HostProtocol"

    * @param hostProtocol input
    * @return  api call
    */
    public func putCurrentHostProtocol(
        hostProtocol: HostProtocol
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/current-host-protocol"
            , body: hostProtocol
        )
    }
    /**
    * Write host inactivity period
    * 
    * LWM2M path: /1024//34
    * Body converter id: "integer_uint16"

    * @param key input
    * @return  api call
    */
    public func putHostInactivityPeriod(
        key: Int
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/host-inactivity-period"
            , body: key
        )
    }
    /**
    * Set lock infos 
    * 
    * LWM2M path: /1024//6
    * Body converter id: "InterfaceLock"

    * @param infos input
    * @return  api call
    */
    public func putLock(
        infos: InterfaceLock
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/lock"
            , body: infos
        )
    }
    /**
    * Write mqtt net key
    * 
    * LWM2M path: /1024//55
    * Body converter id: "string"

    * @param netkey input
    * @return  api call
    */
    public func putMqttRelayNetKey(
        netkey: String
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/mqtt/relay/net-key"
            , body: netkey
        )
    }
    /**
    * Write mqtt relay password
    * 
    * LWM2M path: /1024//54
    * Body converter id: "string"

    * @param url input
    * @return  api call
    */
    public func putMqttRelayPassword(
        url: String
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/mqtt/relay/password"
            , body: url
        )
    }
    /**
    * Write service name of the mqtt broker
    * 
    * LWM2M path: /1024//51
    * Body converter id: "string"

    * @param url input
    * @return  api call
    */
    public func putMqttRelayPort(
        url: String
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/mqtt/relay/port"
            , body: url
        )
    }
    /**
    * Write mqtt relay url
    * 
    * LWM2M path: /1024//50
    * Body converter id: "string"

    * @param url input
    * @return  api call
    */
    public func putMqttRelayUrl(
        url: String
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/mqtt/relay/url"
            , body: url
        )
    }
    /**
    * Write iotize gateway ip
    * 
    * LWM2M path: /1024//31
    * Body converter id: "string_ipv4"

    * @param key input
    * @return  api call
    */
    public func putNetworkGatewayIp(
        key: String
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/network/gateway-ip"
            , body: key
        )
    }
    /**
    * Write infrastructure ip
    * 
    * LWM2M path: /1024//30
    * Body converter id: "string_ipv4"

    * @param key input
    * @return  api call
    */
    public func putNetworkInfraIp(
        key: String
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/network/infra-ip"
            , body: key
        )
    }
    /**
    * Write infrastructure ip mask
    * 
    * LWM2M path: /1024//32
    * Body converter id: "string_ipv4mask"

    * @param key input
    * @return  api call
    */
    public func putNetworkInfraIpMask(
        key: String
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/network/infra-ip-mask"
            , body: key
        )
    }
    /**
    * Write network mode
    * 
    * LWM2M path: /1024//15
    * Body converter id: "NetworkMode"

    * @param mode input
    * @return  api call
    */
    public func putNetworkMode(
        mode: NetworkMode
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/network-mode"
            , body: mode
        )
    }
    /**
    * Change wether if nfc pairing is mandatory
    * 
    * LWM2M path: /1024//13
    * Body converter id: "NfcPairingMode"

    * @param mode input
    * @return  api call
    */
    public func putNfcPairingMode(
        mode: NfcPairingMode
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/nfc/pairing-mode"
            , body: mode
        )
    }
    /**
    * Write power optimization level
    * 
    * LWM2M path: /1024//14
    * Body converter id: "LowPowerOptimisationLevel"

    * @param mode input
    * @return  api call
    */
    public func putPowerOptimisationLevel(
        mode: LowPowerOptimisationLevel
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/power-optimisation-level"
            , body: mode
        )
    }
    /**
    * Write network key
    * 
    * LWM2M path: /1024//16
    * Body converter id: "string"

    * @param key input
    * @return  api call
    */
    public func putWepKey(
        key: String
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/wep-key"
            , body: key
        )
    }
    /**
    * Write wifi ssid
    * 
    * LWM2M path: /1024//25
    * Body converter id: "string"

    * @param key input
    * @return  api call
    */
    public func putWifiSsid(
        key: String
    ) -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.PUT
            , path: "/interface/wifi/ssid"
            , body: key
        )
    }
    /**
    * Apply the new configuration on the device
    * 
    * LWM2M path: /1024//10
    * @return  api call
    */
    public func reloadConfig()
         -> ApiRequest<Void>{
        

        return ApiRequest(
            method: TapRequestHeader.MethodType.POST
            , path: "/interface/config-version"
        )
    }

}
