import TapClientApi

public class TapDevice {
	
	public var service : ServiceContainer
	var client: TapClient
	var auth: AuthApi?
	
	public init(client: TapClient){
		let converterProvider = ConverterProvider.getDefaultInstance()
		initTapNLinkModels(provider: converterProvider) // TODO move init from here
		self.service = ServiceContainer(client: client, converterProvider: converterProvider)
		self.client = client
	}
	
	public static func createFrom(protocol p: ComProtocol) -> TapDevice{
		let client = TapClient(withProtocol: p)
		return TapDevice(client: client)
	}
	
	public func login(username: String, password: String) throws {
		if (self.auth == nil){
			try self.initAuth()
		}
		let credential = LoginCredential(username: username, password: password)
		return try self.auth!.login(credential: credential)
	}
	
	public func logout() throws {
		try self.auth?.logout()
	}
	
	public func encryption(enabled: Bool) throws {
		if (enabled) {
			let key = try self.service.scram.initialize().body()
			let algo = try AesCBBC128Encryption(key: key)
			self.client._requestInterceptor = EncryptedRequestBuilder(encryptionAlgo: algo)
		}
		else {
			self.client._requestInterceptor = ApduRequestInterceptor()
		}
	}
	
	/**
     *
     */
	public func isEncryptionEnabled() -> Bool {
		return self.client._requestInterceptor is EncryptedRequestBuilder
	}
	
	public func connect(){
		return self.client.connect()
	}
	
	public func disconnect(){
		return self.client.disconnect()
	}
	
	public func getConnectionState() -> ConnectionState {
		return self.client.comProtocol.getConnectionState()
	}
	
	public func initAuth() throws {
		let lockInfo = try self.service.interface.getLock().body()
		if (lockInfo.scramActivated){
			self.auth = ScramAuth(scramService: self.service.scram, interfaceService: self.service.interface)
		}
		else {
			self.auth = DefaultAuth(hashPassword: lockInfo.hashPassword, interfaceApi: self.service.interface)
		}
	}
	
	public class ServiceContainer {
		var client: TapClient
		
		init(client: TapClient, converterProvider: ConverterProvider){
			self.client = client
			self.acl = AclAPI(client: client, converterProvider: converterProvider)
			self.adp = AdpAPI(client: client, converterProvider: converterProvider)
			self.bundle = BundleAPI(client: client, converterProvider: converterProvider)
			self.device = DeviceAPI(client: client, converterProvider: converterProvider)
			self.firmware = FirmwareAPI(client: client, converterProvider: converterProvider)
			self.group = GroupAPI(client: client, converterProvider: converterProvider)
			self.interface = InterfaceAPI(client: client, converterProvider: converterProvider)
			self.scram = ScramAPI(client: client, converterProvider: converterProvider)
			self.singelePacket = SinglePacketAPI(client: client, converterProvider: converterProvider)
			self.target = TargetAPI(client: client, converterProvider: converterProvider)
			self.variable = VariableAPI(client: client, converterProvider: converterProvider)
		}
		
		public var acl: AclAPI
		public var adp: AdpAPI
		public var bundle: BundleAPI
		public var device: DeviceAPI
		public var firmware: FirmwareAPI
		public var group: GroupAPI
		public var interface: InterfaceAPI
		public var scram: ScramAPI
		public var singelePacket: SinglePacketAPI
		public var target: TargetAPI
		public var variable: VariableAPI
	}
}
