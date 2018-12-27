//
//  TestUtility.swift
//  TapClientUnitTests
//
//  Created by dev@iotize.com on 29/12/2018.
//

import Foundation


class TestUtility {
	
	public static func loadTestResource<T>(path: String, _ type: T.Type) -> T where T : Decodable {
		let path = "/Users/developper/Documents/iotize-device-api-spec/tests/" + path
		let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
		return try! JSONDecoder().decode(type, from: data)
	}
}
