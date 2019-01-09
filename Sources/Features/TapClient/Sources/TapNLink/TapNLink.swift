import TapClientApi


public func getDefaultTapAndLinkConverters() -> ConverterProvider{
	let provider = ConverterProvider.getDefaultInstance()
	initTapNLinkModels(provider: provider) // TODO move init from here
	provider.add(id: "UartSettings", converter: ReversedUartSettingsConverter())
	return provider
}


public class TapDevice {
	
	public var service : ServiceContainer
	
	var client: TapClient
	var auth: AuthApi?
	private var sessionKey: Bytes?
	
	public init(client: TapClient, converterProvider: ConverterProvider = getDefaultTapAndLinkConverters()){
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
		try self.auth!.login(credential: credential)
		if (self.auth is ScramAuth){
			// TODO do not implement like this
			self.sessionKey = (self.auth as! ScramAuth).getSessionData()?.key
			try self.encryption(enabled: true)
		}
	}
	
	public func logout() throws {
		if (self.auth == nil){
			try self.initAuth()
		}
		try self.auth!.logout()
		self.sessionKey = nil
	}

	public func encryption(enabled: Bool) throws {
		if (enabled) {
			if (self.sessionKey == nil){
				self.sessionKey = try self.service.scram.initialize().body()
			}
			let algo = try AesCBBC128Encryption(key: self.sessionKey!)
			self.client._requestInterceptor = EncryptedRequestInterceptor(encryptionAlgo: algo)
		}
		else {
			self.sessionKey = nil
			self.client._requestInterceptor = ApduRequestInterceptor()
		}
	}
	
	/**
     *
     */
	public func isEncryptionEnabled() -> Bool {
		return self.client._requestInterceptor is EncryptedRequestInterceptor
	}
	
	public func connect(timeout: UInt? = nil) throws {
		return try self.client.connect(timeout: timeout)
	}
	
	public func disconnect(timeout: UInt? = nil) throws {
		return try self.client.disconnect(timeout: timeout)
	}
	
	public func getConnectionState() -> ConnectionState {
		return self.client.comProtocol.getConnectionState()
	}
	
	func initAuth() throws {
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
			self.datalog = DataLogAPI(client: client, converterProvider: converterProvider)
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
		public var datalog: DataLogAPI
	}
}
