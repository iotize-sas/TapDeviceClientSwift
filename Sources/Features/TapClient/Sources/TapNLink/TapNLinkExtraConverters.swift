//
//  TapNLinkExtraConverter.swift
//  TapClientUnitTests
//
//  Created by dev@iotize.com on 03/01/2019.
//

import Foundation
import IotizeCore

public class ReversedUartSettingsConverter: TapConverter {
	
	let uartSettingsConverter: UartSettingsConverter
	
	init(uartSettingsConverter: UartSettingsConverter = UartSettingsConverter()){
		self.uartSettingsConverter = uartSettingsConverter
	}
	
	public func encode<T>(mymodel: T, stream: TapStreamWriter) -> TapStreamWriter {
		self.uartSettingsConverter.encode(mymodel: mymodel, stream: stream)
		stream.reverseBytes()
		return stream
	}
	
	public func decode<T>(stream: TapStreamReader) -> T {
		var bytes = stream.readBytes(length: 8)!
		bytes.reverse()
		return self.uartSettingsConverter.decode(stream: TapStreamReader(withBytes: bytes));
	}
	
}
