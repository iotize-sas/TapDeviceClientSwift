//
//  BaseTypeConverter.swift
//  BLEProtocol_iOS
//
//  Created by dev@iotize.com on 02/01/2019.
//

import Foundation
import TapClientApi

public class StringConverter: TapConverter {
	
	
	public func decode<T>(stream: TapStreamReader) -> T {
		return (stream.readStrEos(encoding: String.Encoding.ascii) ?? "") as! T
	}
	
	public func encode<T>(mymodel: T, stream: TapStreamWriter) -> TapStreamWriter{
		stream.write(mymodel as! String)
		return stream
	}
	
}

extension String : TapCodable {}

public class UInt32Converter: TapConverter {
	
	
	public func decode<T>(stream: TapStreamReader) -> T {
		return stream.readU4() as! T
	}
	
	public func encode<T>(mymodel: T, stream: TapStreamWriter) -> TapStreamWriter {
		stream.write(mymodel as! UInt32)
		return stream
	}
	
}

public class UInt16Converter: TapConverter {
	
	
	public func decode<T>(stream: TapStreamReader) -> T {
		return stream.readU2() as! T
	}
	
	public func encode<T>(mymodel: T, stream: TapStreamWriter) -> TapStreamWriter {
		stream.write(mymodel as! UInt16)
		return stream
	}
	
}


public class UInt8Converter: TapConverter {
	
	public func decode<T>(stream: TapStreamReader) -> T {
		return stream.readU1() as! T
	}
	
	public func encode<T>(mymodel: T, stream: TapStreamWriter) -> TapStreamWriter {
		stream.write(mymodel as! UInt8)
		return stream
	}
	
}

public class Int8Converter: TapConverter {
	
	
	public func decode<T>(stream: TapStreamReader) -> T {
		return stream.readS1() as! T
	}
	
	public func encode<T>(mymodel: T, stream: TapStreamWriter) -> TapStreamWriter {
		stream.write(mymodel as! Int8)
		return stream
	}
	
}

public class Int16Converter: TapConverter {
	
	
	public func decode<T>(stream: TapStreamReader) -> T {
		return stream.readS2() as! T
	}
	
	public func encode<T>(mymodel: T, stream: TapStreamWriter) -> TapStreamWriter {
		stream.write(mymodel as! Int16)
		return stream
	}
	
}


public class Int32Converter: TapConverter {
	
	
	public func decode<T>(stream: TapStreamReader) -> T {
		return stream.readS4() as! T
	}
	
	public func encode<T>(mymodel: T, stream: TapStreamWriter) -> TapStreamWriter {
		stream.write(mymodel as! Int32)
		return stream
	}
	
}

public class StringVersionConverter: TapConverter {
	
	
	public func decode<T>(stream: TapStreamReader) -> T {
		return stream.readTapVersion().description as! T
	}
	
	public func encode<T>(mymodel: T, stream: TapStreamWriter) -> TapStreamWriter {
		fatalError("Encoding string version is not implemented yet")
	}
	
}


public class BytesToStringConverter: TapConverter {
	
	public var separator: Character
	public var length: Int
	public var formatter : (UInt8) -> String
	public var encoder : (String) -> UInt8

	init(separator: Character, length: Int, formatter: @escaping (UInt8) -> String, encoder: @escaping (String) -> UInt8){
		self.separator = separator
		self.length = length
		self.formatter = formatter
		self.encoder = encoder
	}
	
	public func decode<T>(stream: TapStreamReader) -> T {
		let bytes = stream.readBytes(length: self.length)
		return bytes!.map({ (value: UInt8) -> String in
			return self.formatter(value)
		}).joined(separator: String(self.separator)) as! T
	}
	
	public func encode<T>(mymodel: T, stream: TapStreamWriter) -> TapStreamWriter {
		let model: String = mymodel as! String
		let parts = model.split(separator: self.separator)
		let bytes = parts.map({ (part) -> UInt8 in
			return self.encoder(String(part))
		})
		_ = stream.writeBytes(bytes)
		return stream
	}
	
}

public class StringIpv4Converter: BytesToStringConverter {
	
	public init(){
		super.init(separator: ".", length: 4, formatter: { String($0)}, encoder: { UInt8($0)!})
	}
	
}

public class StringMacAddressConverter: BytesToStringConverter {
	
	public init(){
		super.init(separator: ":", length: 6, formatter: { $0.hexstr }, encoder: { $0.hexbytes[0]})
	}
	
}

public class Float32Converter: TapConverter {

	public func decode<T>(stream: TapStreamReader) -> T {
		return stream.readF4() as! T
	}

	public func encode<T>(mymodel: T, stream: TapStreamWriter) -> TapStreamWriter {
		stream.write(mymodel as! Float32)
		return stream
	}

}

extension Float : TapCodable {}

public class BytesConverter: TapConverter {
	
	public func encode<T>(mymodel: T, stream: TapStreamWriter) -> TapStreamWriter {
		_ = stream.writeBytes(mymodel as! Bytes)
		return stream
	}
	
	public func decode<T>(stream: TapStreamReader) -> T {
		var bytes = stream.readBytesFull()
		if (bytes == nil){
			bytes = Bytes()
		}
		return bytes as! T
	}
	

}
