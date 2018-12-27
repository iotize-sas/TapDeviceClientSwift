//
//  Copyright 2018 IoTize SAS Inc.  Licensed under the MIT license. 
//
//  CBPeripheralConverter.swift
//  device-com-ble.cordova BLE Cordova Plugin
//

import CoreBluetooth

struct DiscoveredDeviceType : Codable{
    public var name: String = ""
    public var address: String = ""
    public var rssi: Int?
    
    init(newName: String, newAddress: String, newRssi: Int?) {
        name = newName
        address = newAddress
        if (newRssi != nil) {
            rssi = newRssi
        }
    }
    
    func ToJSON() -> [AnyHashable: Any] {
        if self.rssi == nil {
            return ["name": name, "address": address]
        }
        return ["name": name, "address": address, "rssi": rssi]
    }
    
    func toJSONString() throws -> String {
        let jsonEncoder = JSONEncoder()
        let jsonData = try jsonEncoder.encode(self)
        
        return String(data: jsonData, encoding: .utf8)!
        
    }
}


import Foundation

class CBPeripheralConverter {
    
    public static func toDiscoveredDeviceType(device: CBPeripheral, rssi: Int? = nil) -> DiscoveredDeviceType {
        return DiscoveredDeviceType(newName: device.name!, newAddress: device.identifier.uuidString as String, newRssi: rssi)
    }
    
    public static func toJSONObject(device: CBPeripheral) -> [AnyHashable: Any] {
        return toDiscoveredDeviceType(device: device).ToJSON()
    }
    public static func toJSONString(device: CBPeripheral) throws -> String {
        return try toDiscoveredDeviceType(device: device).toJSONString()
    }
}
