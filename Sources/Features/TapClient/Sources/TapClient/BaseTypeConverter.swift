//
//  BaseTypeConverter.swift
//  BLEProtocol_iOS
//
//  Created by dev@iotize.com on 02/01/2019.
//

import Foundation


public class StringConverter: TapConverter {
	
	public func id() -> String{
		return "string"
	}
	
	public func decode<T>(stream: TapStreamReader) -> T {
		return (stream.readStrEos(encoding: String.Encoding.ascii) ?? "") as! T
	}
	
	public func encode<T>(mymodel: T, stream: TapStreamWriter) {
		stream.write(mymodel as! String)
	}
	
}

public class UInt32Converter: TapConverter {
	
	public func id() -> String{
		return "integer_uint32"
	}
	
	public func decode<T>(stream: TapStreamReader) -> T {
		return stream.readU1() as! T
	}
	
	public func encode<T>(mymodel: T, stream: TapStreamWriter) {
		stream.write(mymodel as! UInt32)
	}
	
}
