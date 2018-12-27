//
//  Copyright 2018 IoTize SAS Inc.  Licensed under the MIT license. 
//
//  BLECom.swift
//  device-com-ble.cordova BLE Cordova Plugin
//

import Foundation
import CoreBluetooth
import RxSwift

struct IoTizeBleError: Error {
    
    let code: Int
    let message: String
    
    init(code: Int, message: String) {
        self.code = code
        self.message = message
    }
    
    static func BleUnsupported() -> IoTizeBleError { return IoTizeBleError(code:100, message:"Bluetooth is not supported")}
    static func BleUnauthorized() -> IoTizeBleError { return IoTizeBleError(code:101, message:"Bluetooth is not authorized")}
    static func BlePoweredOff() -> IoTizeBleError { return IoTizeBleError(code:102, message:"Bluetooth is powered off")}
    static func BleResetting() -> IoTizeBleError { return IoTizeBleError(code:103, message:"Bluetooth is resetting")}
    static func BleUnknown() -> IoTizeBleError { return IoTizeBleError(code:104, message:"Bluetooth is in an unknown state")}
    
    static func PeripheralConnectionFailed(peripheral: CBPeripheral, error: Error?) -> IoTizeBleError { return IoTizeBleError(code:200, message:"Connection to \(peripheral.name) failed: \(error?.localizedDescription ?? "unknown")" )}
    static func NoDeviceConnected() -> IoTizeBleError { return IoTizeBleError(code:201, message:"No Device Connected")}
    
    static func ServiceDiscoveryFailed(peripheral: CBPeripheral) -> IoTizeBleError { return IoTizeBleError(code:300, message:"Failed to discover services for \(peripheral.name)" )}
    static func CharacteristicsDiscoveryFailed(peripheral: CBPeripheral) -> IoTizeBleError { return IoTizeBleError(code:301, message:"Failed to discover characteristics for \(peripheral.name)" )}
    static func CharacteristicSPPNotFound(peripheral: CBPeripheral) -> IoTizeBleError { return IoTizeBleError(code:302, message:"Characteristic SPP not found for \(peripheral.name)" )}
    static func CharacteristicNotifyChangeFailed() -> IoTizeBleError { return IoTizeBleError(code:304, message:"Failed to set notification for characteristic" )}
    static func BleVersionIsOld(version: String) -> IoTizeBleError { return IoTizeBleError(code:303, message:"BLE firmware version is too old: \(version)" )}
    
    static func InvalidWriteData(peripheral: CBPeripheral) -> IoTizeBleError { return IoTizeBleError(code:403, message:"Invalid write data for \(peripheral.name)" )}
    static func TimedOutRequest(msg: String) -> IoTizeBleError { return IoTizeBleError(code:404, message:"Waiting for response timed out, txData: " + msg )}
	static func InternalError(msg: String) -> IoTizeBleError { return IoTizeBleError(code:500, message:"Internal error. " + msg )}

}

//Main class handling the plugin functionalities.
public class BLEProtocol {
    
    var bleController: BLEManager
    var lastError: IoTizeBleError?
	var deviceUUID: String
	var deviceName: String
	
	
	init(deviceUUID: String, bleController: BLEManager = BLEManager()){
		self.deviceUUID = deviceUUID
		self.deviceName = deviceUUID
		self.bleController = bleController
	}

	
	func connect(timeout: UInt? = nil) -> RxSwift.Observable<Void> {
		return RxSwift.Observable.create { observer in
			self.bleController.connectWithUUID(device: self.deviceUUID, completion: {
				(error: IoTizeBleError?) -> () in
				
				if (error != nil){
					self.lastError = error
					observer.onError(error!)
				}
				else {
					observer.onCompleted()
				}
			})
			return Disposables.create()
		}
    }
	
    func disconnect(timeout: UInt? = nil) -> RxSwift.Observable<Void>  {
        let nameDevice = self.deviceName
		
		return RxSwift.Observable.create { observer in
			self.bleController.disconnect( completion: {
				(error: IoTizeBleError?) -> () in
				if (error != nil){
					self.lastError = error
					observer.onError(error!)
				}
				else {
					observer.onCompleted()
				}
			})
			return Disposables.create()
		}
    }
	
	func send(data: [UInt8]) -> RxSwift.Observable<[UInt8]> {
        let device = self.deviceName
		return RxSwift.Observable.create { observer in
			self.bleController.sendRequest(data: data, completion: {
				(response: Any, error: IoTizeBleError?) -> () in
				
				if (error != nil){
					self.lastError = error
					observer.onError(error!)
				}
				else if (!(response is [UInt8])){
					var internalError = IoTizeBleError.InternalError(msg: "Unexpected response type. Expected bytes.")
					self.lastError = internalError
					observer.onError(internalError)
				}
				else {
					observer.onNext(response as! [UInt8])
					observer.onCompleted()
				}
			})
			return Disposables.create()
		}
		
    }
	
    func isConnected() -> Bool {
        return bleController.isConnected()
    }

    func isReady() -> Bool {
        return bleController.isReady()
    }

}
