import TapClientApi





public class AclEntryConverter: TapConverter {

    public static var ID = "AclEntry"

    public func id() -> String{
        return AclEntryConverter.ID
    }

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = AclEntry()
        stream.forwardBits(length: 3)
        model.create = stream.readBool()
        model.delete = stream.readBool()
        model.execute = stream.readBool()
        model.write = stream.readBool()
        model.read = stream.readBool()
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()){
        let model = mymodel as! AclEntry
        stream.forwardBits(3)

        stream.writeBitsInt(model.create!, 1)
        stream.writeBitsInt(model.delete!, 1)
        stream.writeBitsInt(model.execute!, 1)
        stream.writeBitsInt(model.write!, 1)
        stream.writeBitsInt(model.read!, 1)
        }

}



public class MemoryInfoConverter: TapConverter {

    public static var ID = "MemoryInfo"

    public func id() -> String{
        return MemoryInfoConverter.ID
    }

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = MemoryInfo()
        model.address = stream.readU4()
        model.length = stream.readU4()
        model.sizeInBytes = stream.readU4()
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()){
        let model = mymodel as! MemoryInfo
        stream.writeU4(model.address!)
        stream.writeU4(model.length!)
        stream.writeU4(model.sizeInBytes!)
        }

}



public class MemoryWriteInfoConverter: TapConverter {

    public static var ID = "MemoryWriteInfo"

    public func id() -> String{
        return MemoryWriteInfoConverter.ID
    }

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = MemoryWriteInfo()
        model.address = stream.readU4()
        model.length = stream.readU4()
        model.itemSize = stream.readU1()
        model.value = stream.readBytes(length: Int(1))
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()){
        let model = mymodel as! MemoryWriteInfo
        stream.writeU4(model.address!)
        stream.writeU4(model.length!)
        stream.writeU1(model.itemSize!)
        stream.writeBytes(model.value!)
        }

}



public class ReadWriteRightsConverter: TapConverter {

    public static var ID = "ReadWriteRights"

    public func id() -> String{
        return ReadWriteRightsConverter.ID
    }

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = ReadWriteRights()
        stream.forwardBits(length: 6)
        model.write = stream.readBool()
        model.read = stream.readBool()
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()){
        let model = mymodel as! ReadWriteRights
        stream.forwardBits(6)

        stream.writeBitsInt(model.write!, 1)
        stream.writeBitsInt(model.read!, 1)
        }

}



public class DatalogOptionConverter: TapConverter {

    public static var ID = "DatalogOption"

    public func id() -> String{
        return DatalogOptionConverter.ID
    }

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = DatalogOption()
        stream.forwardBits(length: 6)
        model.security = stream.readBool()
        model.qos = stream.readBool()
        stream.forwardBits(length: 5)
        model.logOnChange = stream.readBool()
        model.rollingMode = stream.readBool()
        model.autoorun = stream.readBool()
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()){
        let model = mymodel as! DatalogOption
        stream.forwardBits(6)

        stream.writeBitsInt(model.security!, 1)
        stream.writeBitsInt(model.qos!, 1)
        stream.forwardBits(5)

        stream.writeBitsInt(model.logOnChange!, 1)
        stream.writeBitsInt(model.rollingMode!, 1)
        stream.writeBitsInt(model.autoorun!, 1)
        }

}



public class UartSettingsConverter: TapConverter {

    public static var ID = "UartSettings"

    public func id() -> String{
        return UartSettingsConverter.ID
    }

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = UartSettings()
        model.ctr2 = stream.readUartSettingsCtr2()
        model.ctr1 = stream.readUartSettingsCtr1()
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()){
        let model = mymodel as! UartSettings
        stream.writeUartSettingsCtr2(model.ctr2)
        stream.writeUartSettingsCtr1(model.ctr1)
        }

}



public class Lwm2mTlvConverter: TapConverter {

    public static var ID = "Lwm2mTlv"

    public func id() -> String{
        return Lwm2mTlvConverter.ID
    }

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = Lwm2mTlv()
        model.identifierType = UInt8(stream.readBitsInt(length: 2))
        model.identifierLength = stream.readBool()
        model.lengthType = UInt8(stream.readBitsInt(length: 2))
        model.other = UInt8(stream.readBitsInt(length: 3))
        model.identifier = stream.readBytes(length: Int(1))
        model.len = stream.readU2()
        model.value = stream.readBytes()
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()){
        let model = mymodel as! Lwm2mTlv
        stream.writeBitsInt(model.identifierType!, 2)
        stream.writeBitsInt(model.identifierLength!, 1)
        stream.writeBitsInt(model.lengthType!, 2)
        stream.writeBitsInt(model.other!, 3)
        stream.writeBytes(model.identifier!)
        stream.writeU2(model.len!)
        stream.writeBytes(model.value!)
        }

}



public class InterfaceLockConverter: TapConverter {

    public static var ID = "InterfaceLock"

    public func id() -> String{
        return InterfaceLockConverter.ID
    }

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = InterfaceLock()
        stream.forwardBits(length: 8)
        stream.forwardBits(length: 3)
        model.scramActivated = stream.readBool()
        model.hashPassword = stream.readBool()
        model.factoryReset = stream.readBool()
        model.resourceLogUid = stream.readBool()
        model.resouceFactory = stream.readBool()
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()){
        let model = mymodel as! InterfaceLock
        stream.forwardBits(8)

        stream.forwardBits(3)

        stream.writeBitsInt(model.scramActivated!, 1)
        stream.writeBitsInt(model.hashPassword!, 1)
        stream.writeBitsInt(model.factoryReset!, 1)
        stream.writeBitsInt(model.resourceLogUid!, 1)
        stream.writeBitsInt(model.resouceFactory!, 1)
        }

}



public class LoginCredentialConverter: TapConverter {

    public static var ID = "LoginCredential"

    public func id() -> String{
        return LoginCredentialConverter.ID
    }

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = LoginCredential()
        model.username = stream.readStr(length: 16)
        model.password = stream.readStr(length: 16)
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()){
        let model = mymodel as! LoginCredential
        stream.writeStr(model.username!, length: 16)
        stream.writeStr(model.password!, length: 16)
        }

}



public class ScramLoginParamsConverter: TapConverter {

    public static var ID = "ScramLoginParams"

    public func id() -> String{
        return ScramLoginParamsConverter.ID
    }

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = ScramLoginParams()
        model.username = stream.readStr(length: 16)
        model.clientNonce = stream.readU4()
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()){
        let model = mymodel as! ScramLoginParams
        stream.writeStr(model.username!)
        stream.writeU4(model.clientNonce!)
        }

}



public class ScramLoginResponseBodyConverter: TapConverter {

    public static var ID = "ScramLoginResponseBody"

    public func id() -> String{
        return ScramLoginResponseBodyConverter.ID
    }

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = ScramLoginResponseBody()
        model.servernonce = stream.readU4()
        model.salt = stream.readBytes(length: Int(4))
        model.iterationNumber = stream.readU4()
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()){
        let model = mymodel as! ScramLoginResponseBody
        stream.writeU4(model.servernonce!)
        stream.writeBytes(model.salt!)
        stream.writeU4(model.iterationNumber!)
        }

}



public class TargetComStatsConverter: TapConverter {

    public static var ID = "TargetComStats"

    public func id() -> String{
        return TargetComStatsConverter.ID
    }

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = TargetComStats()
        model.nbFailCom = stream.readU4()
        model.nbSuccessfulCom = stream.readU4()
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()){
        let model = mymodel as! TargetComStats
        stream.writeU4(model.nbFailCom!)
        stream.writeU4(model.nbSuccessfulCom!)
        }

}



public class AvailableFunctionConverter: TapConverter {

    public static var ID = "AvailableFunction"

    public func id() -> String{
        return AvailableFunctionConverter.ID
    }

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = AvailableFunction()
        stream.forwardBits(length: 6)
        model.debug = stream.readBool()
        model.datalog = stream.readBool()
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()){
        let model = mymodel as! AvailableFunction
        stream.forwardBits(6)

        stream.writeBitsInt(model.debug!, 1)
        stream.writeBitsInt(model.datalog!, 1)
        }

}



public class CrcCheckBodyConverter: TapConverter {

    public static var ID = "CrcCheckBody"

    public func id() -> String{
        return CrcCheckBodyConverter.ID
    }

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = CrcCheckBody()
        model.address = stream.readU4()
        model.size = stream.readU4()
        model.crc = stream.readU4()
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()){
        let model = mymodel as! CrcCheckBody
        stream.writeU4(model.address!)
        stream.writeU4(model.size!)
        stream.writeU4(model.crc!)
        }

}


func initTapNLinkModels(provider: ConverterProvider){



 provider.add(converter: AclEntryConverter())

 provider.add(converter: MemoryInfoConverter())

 provider.add(converter: MemoryWriteInfoConverter())

 provider.add(converter: ReadWriteRightsConverter())

 provider.add(converter: DatalogOptionConverter())

 provider.add(converter: UartSettingsConverter())

 provider.add(converter: Lwm2mTlvConverter())

 provider.add(converter: InterfaceLockConverter())

 provider.add(converter: LoginCredentialConverter())

 provider.add(converter: ScramLoginParamsConverter())

 provider.add(converter: ScramLoginResponseBodyConverter())

 provider.add(converter: TargetComStatsConverter())

 provider.add(converter: AvailableFunctionConverter())

 provider.add(converter: CrcCheckBodyConverter())

}
