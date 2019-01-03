//
//  KaitaiSeekableStream.swift
//  KaitaiStream
//
//  Created by Mothlike on 25.04.16.
//  Copyright © 2016 Dmitry Marochko. All rights reserved.
//
import Foundation

protocol KaitaiBaseStream {
	var position:Int { get }
	var isEOF:Bool { get }
	
	func seek(position:Int)
	func size() -> Int
}

//class KaitaiBaseStream: KaitaiStream{
//	prot let bytes:[UInt8]
//
//	public func reverse(){
//
//	}
//}

protocol KaitaiSeekableStream: KaitaiBaseStream {
    func read() -> UInt8?
    func read(length:Int) -> [UInt8]?
}

protocol KaitaiWritableStream: KaitaiBaseStream{
	func write(_ bytes: [UInt8])
}

class ByteArraySeekableStream:KaitaiSeekableStream {
	private let bytes:[UInt8]

    private(set) var position:Int = 0

    var isEOF:Bool {
        return !(position < bytes.count)
    }

    init(bytes:[UInt8]) {
        self.bytes = bytes
    }

    func seek(position: Int) {
        self.position = position
    }

    func read() -> UInt8? {
        guard !isEOF else {
            return nil
        }

        let value = bytes[position]

        position += 1

        return value
    }

    func read(length: Int) -> [UInt8]? {
        guard !isEOF else {
            return nil
        }

        guard position + length <= bytes.count else {
            return nil
        }

        let range = Array(bytes[position..<position + length])

        position += length

        return range
    }
	
	func size() -> Int {
		return self.bytes.count
	}
}

class NSDataSeekableStream:KaitaiSeekableStream {
    private let data:NSData

    private(set) var position:Int = 0

    var isEOF:Bool {
        return !(position < data.length)
    }

    init(data:NSData) {
        self.data = data
    }

    func seek(position: Int) {
        self.position = position
    }

    func read() -> UInt8? {
        guard !isEOF else {
            return nil
        }

		var bytes = [UInt8](repeating: 0, count: 1)

        data.getBytes(&bytes, length: 1)

        position += 1

        return bytes[0]
    }

    func read(length: Int) -> [UInt8]? {
        guard !isEOF else {
            return nil
        }

        guard position + length <= data.length else {
            return nil
        }

		var bytes = [UInt8](repeating: 0, count: length)

        if position == 0 {
            data.getBytes(&bytes, length: length)
        } else {
            let range = NSRange(location: position, length: length)
            data.getBytes(&bytes, range: range)
        }

        position += length

        return bytes
    }
	
	func size() -> Int {
		return self.data.length
	}
}

//class NSFileHandleSeekableStream:KaitaiSeekableStream {
//	private let file:FileHandle
//
//    private(set) var position:Int = 0
//
//    var isEOF:Bool {
//        let byte = read()
//
//        if byte != nil {
//			seek(position: position-1)
//        }
//
//        return byte == nil
//    }
//
//    init?(path:String) {
//		guard let file = FileHandle(forReadingAtPath: path) else {
//            return nil
//        }
//
//        self.file = file
//    }
//
//    init?(url:NSURL) {
//		guard let file = try? FileHandle(forReadingFrom:url as URL) else {
//            return nil
//        }
//
//        self.file = file
//    }
//
//    deinit {
//        file.closeFile()
//    }
//
//    func seek(position: Int) {
//        self.position = position
//		file.seek(toFileOffset: UInt64(position))
//    }
//
//    func read() -> UInt8? {
//		let data = file.readData(ofLength: 1)
//
//		guard data.count == 1 else {
//			seek(position: position)
//
//            return nil
//        }
//
//		var bytes = [UInt8](repeating: 0, count: 1)
//		copyBytes.getBytes(&bytes, length: 1)
//
//        position += 1
//
//        return bytes[0]
//    }
//
//    func read(length: Int) -> [UInt8]? {
//		let data = file.readData(ofLength: length)
//
//		guard data.count == length else {
//			seek(position: position)
//
//            return nil
//        }
//        
//		var bytes = [UInt8](repeating: 0, count: length)
//		copyBytes.getBytes(&bytes, length: length)
//        
//        position += length
//        
//        return bytes
//    }
//	
//	
//	func size() -> Int {
//		return 0 // TODO
//	}
//}
