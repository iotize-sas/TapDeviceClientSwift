//
//  RxTapClientApi.swift
//  BLEProtocol_iOS
//
//  Created by dev@iotize.com on 27/12/2018.
//

import Foundation
import RxSwift


public protocol RxComProtocol{
	
	func connect() -> Observable<Any>
	func disconnect() -> Observable<Any>
	
	func read()  -> Observable<[UInt8]>
	func write(data: Bytes) -> Observable<Any>
	
}
