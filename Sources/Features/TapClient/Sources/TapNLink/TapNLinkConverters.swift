/**
 * This file has been generated
 * DO NOT EDIT DIRECTLY, IT MAY BE OVERWRITE
 */

import TapClientApi





public class AvailablePowerSourceEnumConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let rawValue = stream.readU1()
        let model = AvailablePowerSource(rawValue: rawValue)
        if (model == nil){
            // TODO throw
        }
        return model! as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! AvailablePowerSource
        stream.write(model.rawValue)
        return stream
    }
}

public class FirmwareStateEnumConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let rawValue = stream.readU1()
        let model = FirmwareState(rawValue: rawValue)
        if (model == nil){
            // TODO throw
        }
        return model! as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! FirmwareState
        stream.write(model.rawValue)
        return stream
    }
}

public class FirmwareUpdateResultEnumConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let rawValue = stream.readU1()
        let model = FirmwareUpdateResult(rawValue: rawValue)
        if (model == nil){
            // TODO throw
        }
        return model! as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! FirmwareUpdateResult
        stream.write(model.rawValue)
        return stream
    }
}

public class HostProtocolEnumConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let rawValue = stream.readU1()
        let model = HostProtocol(rawValue: rawValue)
        if (model == nil){
            // TODO throw
        }
        return model! as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! HostProtocol
        stream.write(model.rawValue)
        return stream
    }
}

public class ListTargetProtocolEnumConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let rawValue = stream.readU1()
        let model = ListTargetProtocol(rawValue: rawValue)
        if (model == nil){
            // TODO throw
        }
        return model! as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! ListTargetProtocol
        stream.write(model.rawValue)
        return stream
    }
}

public class ListHostProtocolEnumConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let rawValue = stream.readU1()
        let model = ListHostProtocol(rawValue: rawValue)
        if (model == nil){
            // TODO throw
        }
        return model! as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! ListHostProtocol
        stream.write(model.rawValue)
        return stream
    }
}

public class LowPowerOptimisationLevelEnumConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let rawValue = stream.readU1()
        let model = LowPowerOptimisationLevel(rawValue: rawValue)
        if (model == nil){
            // TODO throw
        }
        return model! as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! LowPowerOptimisationLevel
        stream.write(model.rawValue)
        return stream
    }
}

public class NetworkModeEnumConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let rawValue = stream.readU1()
        let model = NetworkMode(rawValue: rawValue)
        if (model == nil){
            // TODO throw
        }
        return model! as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! NetworkMode
        stream.write(model.rawValue)
        return stream
    }
}

public class CloudConnectionModeEnumConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let rawValue = stream.readU1()
        let model = CloudConnectionMode(rawValue: rawValue)
        if (model == nil){
            // TODO throw
        }
        return model! as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! CloudConnectionMode
        stream.write(model.rawValue)
        return stream
    }
}

public class TargetProtocolEnumConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let rawValue = stream.readU1()
        let model = TargetProtocol(rawValue: rawValue)
        if (model == nil){
            // TODO throw
        }
        return model! as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! TargetProtocol
        stream.write(model.rawValue)
        return stream
    }
}

public class CoretypeEnumConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let rawValue = stream.readU1()
        let model = Coretype(rawValue: rawValue)
        if (model == nil){
            // TODO throw
        }
        return model! as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! Coretype
        stream.write(model.rawValue)
        return stream
    }
}

public class NfcPairingModeEnumConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let rawValue = stream.readU1()
        let model = NfcPairingMode(rawValue: rawValue)
        if (model == nil){
            // TODO throw
        }
        return model! as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! NfcPairingMode
        stream.write(model.rawValue)
        return stream
    }
}

public class TargetCoreTypeEnumConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let rawValue = stream.readU1()
        let model = TargetCoreType(rawValue: rawValue)
        if (model == nil){
            // TODO throw
        }
        return model! as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! TargetCoreType
        stream.write(model.rawValue)
        return stream
    }
}




public class AclEntryConverter: TapConverter {

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

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! AclEntry
        stream.forwardBits(3)

        _ = stream.writeBitsInt(model.create!, 1)
        _ = stream.writeBitsInt(model.delete!, 1)
        _ = stream.writeBitsInt(model.execute!, 1)
        _ = stream.writeBitsInt(model.write!, 1)
        _ = stream.writeBitsInt(model.read!, 1)
        return stream
    }

}




public class MemoryInfoConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = MemoryInfo()
        model.address = stream.readU4()
        model.wordCount = stream.readU4()
        model.wordSize = MemoryInfo.WordSizeType(rawValue:stream.readU1())

        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! MemoryInfo
        _ = stream.writeU4(model.address!)
        _ = stream.writeU4(model.wordCount!)
        _ = stream.writeU1(model.wordSize!.rawValue)
        return stream
    }

}




public class MemoryWriteInfoConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = MemoryWriteInfo()
        model.address = stream.readMemoryInfo()
        model.value = stream.readBytes()
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! MemoryWriteInfo
        _ = stream.writeMemoryInfo(model.address)
        _ = stream.writeBytes(model.value!)
        return stream
    }

}




public class ReadWriteRightsConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = ReadWriteRights()
        stream.forwardBits(length: 6)
        model.write = stream.readBool()
        model.read = stream.readBool()
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! ReadWriteRights
        stream.forwardBits(6)

        _ = stream.writeBitsInt(model.write!, 1)
        _ = stream.writeBitsInt(model.read!, 1)
        return stream
    }

}




public class DatalogOptionConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = DatalogOption()
        stream.forwardBits(length: 6)
        model.security = stream.readBool()
        model.qos = stream.readBool()
        stream.forwardBits(length: 5)
        model.logOnChange = stream.readBool()
        model.rollingMode = stream.readBool()
        model.autorun = stream.readBool()
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! DatalogOption
        stream.forwardBits(6)

        _ = stream.writeBitsInt(model.security!, 1)
        _ = stream.writeBitsInt(model.qos!, 1)
        stream.forwardBits(5)

        _ = stream.writeBitsInt(model.logOnChange!, 1)
        _ = stream.writeBitsInt(model.rollingMode!, 1)
        _ = stream.writeBitsInt(model.autorun!, 1)
        return stream
    }

}




public class UartSettingsConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = UartSettings()
        model.ctr2 = stream.readUartSettingsCtr2()
        model.ctr1 = stream.readUartSettingsCtr1()
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! UartSettings
        _ = stream.writeUartSettingsCtr2(model.ctr2)
        _ = stream.writeUartSettingsCtr1(model.ctr1)
        return stream
    }

}




public class TapVersionConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = TapVersion()
        model.major = stream.readU1()
        model.minor = stream.readU1()
        model.build = stream.readU2()
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! TapVersion
        _ = stream.writeU1(model.major!)
        _ = stream.writeU1(model.minor!)
        _ = stream.writeU2(model.build!)
        return stream
    }

}




public class Lwm2mTlvConverter: TapConverter {

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

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! Lwm2mTlv
        _ = stream.writeBitsInt(model.identifierType!, 2)
        _ = stream.writeBitsInt(model.identifierLength!, 1)
        _ = stream.writeBitsInt(model.lengthType!, 2)
        _ = stream.writeBitsInt(model.other!, 3)
        _ = stream.writeBytes(model.identifier!)
        _ = stream.writeU2(model.len!)
        _ = stream.writeBytes(model.value!)
        return stream
    }

}




public class InterfaceLockConverter: TapConverter {

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

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! InterfaceLock
        stream.forwardBits(8)

        stream.forwardBits(3)

        _ = stream.writeBitsInt(model.scramActivated!, 1)
        _ = stream.writeBitsInt(model.hashPassword!, 1)
        _ = stream.writeBitsInt(model.factoryReset!, 1)
        _ = stream.writeBitsInt(model.resourceLogUid!, 1)
        _ = stream.writeBitsInt(model.resouceFactory!, 1)
        return stream
    }

}




public class LoginCredentialConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = LoginCredential()
        model.username = stream.readStr(length: 16)
        model.password = stream.readStr(length: 16)
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! LoginCredential
        _ = stream.writeStr(model.username!, length: Int(16))
        _ = stream.writeStr(model.password!, length: Int(16))
        return stream
    }

}




public class LoginCredentialHashedConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = LoginCredentialHashed()
        model.username = stream.readStr(length: 16)
        model.password = stream.readBytes(length: Int(16))
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! LoginCredentialHashed
        _ = stream.writeStr(model.username!, length: Int(16))
        _ = stream.writeBytes(model.password!)
        return stream
    }

}




public class ScramLoginParamsConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = ScramLoginParams()
        model.username = stream.readStr(length: 16)
        model.clientNonce = stream.readU4()
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! ScramLoginParams
        _ = stream.writeStr(model.username!, length: Int(16))
        _ = stream.writeU4(model.clientNonce!)
        return stream
    }

}




public class ScramLoginResponseBodyConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = ScramLoginResponseBody()
        model.serverNonce = stream.readU4()
        model.salt = stream.readBytes(length: Int(4))
        model.iterationNumber = stream.readU4()
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! ScramLoginResponseBody
        _ = stream.writeU4(model.serverNonce!)
        _ = stream.writeBytes(model.salt!)
        _ = stream.writeU4(model.iterationNumber!)
        return stream
    }

}




public class TargetComStatsConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = TargetComStats()
        model.nbFailCom = stream.readU4()
        model.nbSuccessfulCom = stream.readU4()
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! TargetComStats
        _ = stream.writeU4(model.nbFailCom!)
        _ = stream.writeU4(model.nbSuccessfulCom!)
        return stream
    }

}




public class AvailableFunctionConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = AvailableFunction()
        stream.forwardBits(length: 6)
        model.debug = stream.readBool()
        model.datalog = stream.readBool()
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! AvailableFunction
        stream.forwardBits(6)

        _ = stream.writeBitsInt(model.debug!, 1)
        _ = stream.writeBitsInt(model.datalog!, 1)
        return stream
    }

}




public class CrcCheckBodyConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = CrcCheckBody()
        model.address = stream.readU4()
        model.size = stream.readU4()
        model.crc = stream.readU4()
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! CrcCheckBody
        _ = stream.writeU4(model.address!)
        _ = stream.writeU4(model.size!)
        _ = stream.writeU4(model.crc!)
        return stream
    }

}




public class SinglePacketConverter: TapConverter {

    public func decode<T>(stream: TapStreamReader) -> T {
        let model = SinglePacket()
        model.sendTime = stream.readU4()
        model.packetLength = stream.readU2()
        model.packetId = stream.readU2()
        model.configVersion = stream.readU4()
        model.messageType = SinglePacket.PacketType(rawValue:UInt8(stream.readBitsInt(length: 4)))

        stream.forwardBits(length: 2)
        model.encryption = stream.readBool()
        model.ack = stream.readBool()
        model.senderId = stream.readU1()
        model.salt = stream.readU2()
        model.logTime = stream.readU4()
        model.dataSize = stream.readU2()
        model.data = stream.readBytes(length: Int(Int(model.dataSize)))
        model.padding = stream.readBytes(length: Int((4 - (( Int(model.dataSize) + 10) % 4)) % 4))
        model.crc = stream.readU4()
        return model as! T
    }

    public func encode<T>(mymodel: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter {
        let model = mymodel as! SinglePacket
        _ = stream.writeU4(model.sendTime!)
        _ = stream.writeU2(model.packetLength!)
        _ = stream.writeU2(model.packetId!)
        _ = stream.writeU4(model.configVersion!)
        _ = stream.writeBitsInt(model.messageType!.rawValue, 4)
        stream.forwardBits(2)

        _ = stream.writeBitsInt(model.encryption!, 1)
        _ = stream.writeBitsInt(model.ack!, 1)
        _ = stream.writeU1(model.senderId!)
        _ = stream.writeU2(model.salt!)
        _ = stream.writeU4(model.logTime!)
        _ = stream.writeU2(model.dataSize!)
        _ = stream.writeBytes(model.data!)
        _ = stream.writeBytes(model.padding!)
        _ = stream.appendCRC()
        return stream
    }

}



func initTapNLinkModels(provider: ConverterProvider){




    provider.add(id: "AvailablePowerSource", converter: AvailablePowerSourceEnumConverter())

    provider.add(id: "FirmwareState", converter: FirmwareStateEnumConverter())

    provider.add(id: "FirmwareUpdateResult", converter: FirmwareUpdateResultEnumConverter())

    provider.add(id: "HostProtocol", converter: HostProtocolEnumConverter())

    provider.add(id: "ListTargetProtocol", converter: ListTargetProtocolEnumConverter())

    provider.add(id: "ListHostProtocol", converter: ListHostProtocolEnumConverter())

    provider.add(id: "LowPowerOptimisationLevel", converter: LowPowerOptimisationLevelEnumConverter())

    provider.add(id: "NetworkMode", converter: NetworkModeEnumConverter())

    provider.add(id: "CloudConnectionMode", converter: CloudConnectionModeEnumConverter())

    provider.add(id: "TargetProtocol", converter: TargetProtocolEnumConverter())

    provider.add(id: "Coretype", converter: CoretypeEnumConverter())

    provider.add(id: "NfcPairingMode", converter: NfcPairingModeEnumConverter())

    provider.add(id: "TargetCoreType", converter: TargetCoreTypeEnumConverter())



 provider.add(id: "AclEntry", converter: AclEntryConverter())


 provider.add(id: "MemoryInfo", converter: MemoryInfoConverter())


 provider.add(id: "MemoryWriteInfo", converter: MemoryWriteInfoConverter())


 provider.add(id: "ReadWriteRights", converter: ReadWriteRightsConverter())


 provider.add(id: "DatalogOption", converter: DatalogOptionConverter())


 provider.add(id: "UartSettings", converter: UartSettingsConverter())


 provider.add(id: "TapVersion", converter: TapVersionConverter())


 provider.add(id: "Lwm2mTlv", converter: Lwm2mTlvConverter())


 provider.add(id: "InterfaceLock", converter: InterfaceLockConverter())


 provider.add(id: "LoginCredential", converter: LoginCredentialConverter())


 provider.add(id: "LoginCredentialHashed", converter: LoginCredentialHashedConverter())


 provider.add(id: "ScramLoginParams", converter: ScramLoginParamsConverter())


 provider.add(id: "ScramLoginResponseBody", converter: ScramLoginResponseBodyConverter())


 provider.add(id: "TargetComStats", converter: TargetComStatsConverter())


 provider.add(id: "AvailableFunction", converter: AvailableFunctionConverter())


 provider.add(id: "CrcCheckBody", converter: CrcCheckBodyConverter())


 provider.add(id: "SinglePacket", converter: SinglePacketConverter())


}