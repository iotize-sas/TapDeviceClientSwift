//
//  Crypto.swift
//  BLEProtocol_iOS
//
//  Created by dev@iotize.com on 28/12/2018.
//

import Foundation
import CryptoSwift
import TapClientApi

struct PBKDF2Options {
	var iterations: Int
	var salt: Bytes
	var keylen: Int
	var variant: HMAC.Variant
}

let DEFAULT_PASSWORD_HASHER_OPTIONS = PBKDF2Options(
	iterations: 4096,
	salt: "n0 salt in 1oTi2e".bytes,
	keylen: 16,
	variant: HMAC.Variant.sha1
)
//
//let PASSWORD_HASHER_OPTIONS = PBKDF2Options(
//	iterations: 4096,
//	salt: "n0 salt in 1oTi2e".bytes,
//	key$`
//	len: 128,
//	variant: HMAC.Variant.sha256
//)

class TapPasswordHasher {
	
	var options: PBKDF2Options
	
	init(options: PBKDF2Options = DEFAULT_PASSWORD_HASHER_OPTIONS){
		self.options = DEFAULT_PASSWORD_HASHER_OPTIONS
	}
	
	func hash(input: String) throws -> String {
		let algo = try PKCS5.PBKDF2(
			password: input.bytes,
			salt: self.options.salt,
			iterations: self.options.iterations,
			keyLength: self.options.keylen,
			variant: self.options.variant
		)
		let result = try algo.calculate()
		return result.ascii
	}
}


public class Crypto {

	// Session password hashing using PBKDF2 with HMAC-SHA1 as PRF
	public static func passwordHash(password: String) throws -> Bytes {
		let algo = try PKCS5.PBKDF2(
			password: password.bytes,
			salt: DEFAULT_PASSWORD_HASHER_OPTIONS.salt,
			iterations: DEFAULT_PASSWORD_HASHER_OPTIONS.iterations,
			keyLength: DEFAULT_PASSWORD_HASHER_OPTIONS.keylen,
			variant: DEFAULT_PASSWORD_HASHER_OPTIONS.variant
		)
		let result = try algo.calculate()
		return result
	}
	
}

