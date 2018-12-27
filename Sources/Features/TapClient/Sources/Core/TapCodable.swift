//
//  TapCodable.swift
//  BLEProtocol_iOS
//
//  Created by dev@iotize.com on 28/12/2018.
//

import Foundation

public class TapEncoder {
	
	/// Encodes the given top-level value and returns its JSON representation.
	///
	/// - parameter value: The value to encode.
	/// - returns: A new `Data` value containing the encoded JSON data.
	/// - throws: `EncodingError.invalidValue` if a non-conforming floating-point value is encountered during encoding, and the encoding strategy is `.throw`.
	/// - throws: An error if any value throws an error during encoding.
//	open func encode<T>(_ value: T) throws -> Data where T : Encodable
}

public class TapDecoder {
	
	
	/// Decodes a top-level value of the given type from the given JSON representation.
	///
	/// - parameter type: The type of the value to decode.
	/// - parameter data: The data to decode from.
	/// - returns: A value of the requested type.
	/// - throws: `DecodingError.dataCorrupted` if values requested from the payload are corrupted, or if the given data is not valid JSON.
	/// - throws: An error if any value throws an error during decoding.
//	open func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable {
//
//	}
}
