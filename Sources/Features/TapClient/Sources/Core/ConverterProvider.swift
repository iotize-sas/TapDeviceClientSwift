//
//  File.swift
//  BLEProtocol_iOS
//
//  Created by dev@iotize.com on 02/01/2019.
//

import Foundation
import TapClientApi
import IotizeCore


//public protocol TapConverter {
//
//	func id() -> String;
//	func encode(model: TapCodable, stream: TapStreamWriter);
//	func decode(stream: TapStreamReader) -> TapCodable;
//
//}

public protocol TapConverter {
	
	func encode<T>(mymodel: T, stream: TapStreamWriter) -> TapStreamWriter
	
	func decode<T>(stream: TapStreamReader) -> T
	
}

public class TapConverterContainer<T>{
	
	var converter: TapConverter
	
	init(converter: TapConverter){
		self.converter = converter
	}
	
	public func encode(model: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter{
		_ = self.converter.encode(mymodel: model, stream: stream);
		return stream
	}
	
	public func decode(stream: TapStreamReader) -> T {
		return self.converter.decode(stream: stream);
	}
}

open class ConverterProvider {
	
	static var instance: ConverterProvider?
	
	var converters = [String: TapConverter]()
	
	public func get<T>(id: String) -> TapConverterContainer<T>{
		let converter = self.converters[id]
		if (converter == nil){
			fatalError("converter does not exist: " + id) // TODO
		}
		return TapConverterContainer<T>(converter: converter!)
	}
	
	public func getNoType(id: String) -> TapConverter{
		let converter = self.converters[id]
		if (converter == nil){
			fatalError("converter does not exist: " + id) // TODO
		}
		return converter!
	}
	
	public func add(id: String, converter: TapConverter){
		self.converters[id] = converter
	}
	
	public static func getDefaultInstance() -> ConverterProvider{
		if (ConverterProvider.instance == nil){
			ConverterProvider.instance = ConverterProvider()
			ConverterProvider.instance!.add(id: "string", converter: StringConverter())
			ConverterProvider.instance!.add(id: "float", converter: Float32Converter())
			ConverterProvider.instance!.add(id: "integer_uint32", converter: UInt32Converter())
			ConverterProvider.instance!.add(id: "integer_uint16", converter: UInt16Converter())
			ConverterProvider.instance!.add(id: "integer_uint8", converter: UInt8Converter())
			ConverterProvider.instance!.add(id: "integer_int32", converter: Int32Converter())
			ConverterProvider.instance!.add(id: "integer_int16", converter: Int16Converter())
			ConverterProvider.instance!.add(id: "integer_int32", converter: Int8Converter())
			ConverterProvider.instance!.add(id: "string_version", converter: StringVersionConverter())
			ConverterProvider.instance!.add(id: "string_macaddress", converter: StringMacAddressConverter())
			ConverterProvider.instance!.add(id: "string_ipv4", converter: StringIpv4Converter())
			ConverterProvider.instance!.add(id: "string_ipv4mask", converter: StringIpv4Converter())
			ConverterProvider.instance!.add(id: "Bytes", converter: BytesConverter())

		}
		return ConverterProvider.instance!
	}
}


