//
//  TapNLinkExtraModels.swift
//  BLEProtocol_iOS
//
//  Created by dev@iotize.com on 04/01/2019.
//

import Foundation

public extension MemoryInfo.WordSizeType {
	public var asByte: Int {
		switch self {
		case ._32_BITS:
			return 4
		case ._16_BITS:
			return 2
		case ._8_BITS:
			return 1
		default:
			return 0
		}
	}
}

public extension UartSettings {
	
	public convenience init(
		physicalPort: PhysicalPort,
		stopBit: StopBit,
		parity: BitParity,
		dataLength: UInt8,
		handshakeDelimiter: HandshakeDelimiter,
		handshakeValue: Handshake,
		timeout: UInt8,
		slv: UInt8,
		ofs: Bool,
		baudrate: Int
	){
		self.init(ctr2: Ctr2(slv: slv, ofs: ofs, baudrate: baudrate),
				  ctr1: Ctr1(physicalPort: physicalPort, stopBit: stopBit, parity: parity, dataLength: dataLength, handshakeDelimiter: handshakeDelimiter, handshakeValue: handshakeValue, timeout: timeout)
		)
	}
	
}
