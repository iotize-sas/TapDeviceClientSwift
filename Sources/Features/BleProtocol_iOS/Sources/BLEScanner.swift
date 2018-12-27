//
//  BLEScanner.swift
//  BLEProtocol_iOS
//
//  Created by dev@iotize.com on 27/12/2018.
//

import Foundation
import RxSwift


public class BLEScanner {
	
	var bleController: BLEManager
	
	init(bleController: BLEManager = BLEManager()){
		self.bleController = bleController
	}
	
	
	//    func checkAvailable(command: CDVInvokedUrlCommand) {
	//
	//        DispatchQueue.main.async {
	//
	//            //from ios5
	//            if ( floor(NSFoundationVersionNumber) <= floor(NSFoundationVersionNumber_iOS_5_1) ){
	//                self.sendError(command: command, result: IoTizeBleError.BleUnsupported().message)
	//            }
	//
	//            //check State
	//            self.bleController.checkState(completion: {
	//                (error: IoTizeBleError?) -> () in
	//
	//                DispatchQueue.main.async {
	//
	//                    if (error != nil){
	//                        self.lastError = error
	//                        self.sendError(command: command, result: error!.message)
	//                    }
	//                    else {
	//                        self.sendSuccess(command: command, result: true)
	//                    }
	//
	//                }
	//            })
	//        }
	//    }
	
	func isReady() -> Bool {
		return bleController.isReady()
	}
	
	func start() -> RxSwift.Observable<Any>{
		
//		if (!self.isReady()){
//			
//			DispatchQueue.main.async {
//				Thread.sleep(forTimeInterval: 0.01)
//				self.startScan(command: command)
//			}
//			return
//		}
		
		return RxSwift.Observable.create { observer in
			self.bleController.beginScan(completion: {
				(result: Any, error: IoTizeBleError?) -> () in
					if (error != nil){
						//self.lastError = error
						observer.onError(error!)
						return;
					}
				
					observer.onNext(result)
//					if let resultString = result as? String{
//						self.sendSuccessWithResponse(command: command, result: resultString)
//					} else if let resultDiscoveredDevice = result as? DiscoveredDeviceType {
//						self.sendSuccessWithResponse(command: command, result: resultDiscoveredDevice)
//					} else if let resultDevice = result as? CBPeripheral {
//						self.sendSuccessWithResponse(command: command, result: CBPeripheralConverter.toDiscoveredDeviceType(device: resultDevice))
//					} else {
//					}
			})
			return Disposables.create()
		}
	}
	
	func stop() {
		bleController.stopScan();
	}
}
