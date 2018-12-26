//
// ApiResponse.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct ApiResponse: Codable {

    public var code: Int?
    public var payload: [Int]?

    public init(code: Int?, payload: [Int]?) {
        self.code = code
        self.payload = payload
    }


}

