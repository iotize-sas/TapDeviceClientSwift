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
	
	func id() -> String
	
	func encode<T>(mymodel: T, stream: TapStreamWriter)
	
	func decode<T>(stream: TapStreamReader) -> T
	
}

public class TapConverterContainer<T>{
	
	var converter: TapConverter
	
	init(converter: TapConverter){
		self.converter = converter
	}
	
	public func encode(model: T, stream: TapStreamWriter = TapStreamWriter()) -> TapStreamWriter{
		self.converter.encode(mymodel: model, stream: stream);
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
	
	public func add(converter: TapConverter){
		self.converters[converter.id()] = converter
	}
	
	public static func getDefaultInstance() -> ConverterProvider{
		if (ConverterProvider.instance == nil){
			ConverterProvider.instance = ConverterProvider()
			ConverterProvider.instance!.add(converter: StringConverter())
			ConverterProvider.instance!.add(converter: UInt32Converter())
		}
		return ConverterProvider.instance!
	}
}


