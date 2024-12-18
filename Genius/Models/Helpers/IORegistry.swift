//
// IORegistry.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import CoreFoundation
import Foundation
import IOKit

enum IORegistry {

	static func read<W: DataInitializable>(class className: String? = nil, name: String? = nil, _ key: String) -> W? {
		guard let matchingDictionary: CFMutableDictionary =
			className.map({ IOServiceMatching($0) }) ??
			name.map({ IOServiceNameMatching($0) })
		else { return nil }
		let service = IOServiceGetMatchingService(kIOMasterPortDefault, matchingDictionary)
		defer { IOObjectRelease(service) }
		guard service > 0 else { return nil }
		let property = IORegistryEntryCreateCFProperty(service, key as CFString, kCFAllocatorDefault, 0)?.takeRetainedValue()
		return property as? W ?? ((property as? Data)?.trimmingTrailingZeros()).flatMap(W.init)
	}

	static func serviceExists(class className: String? = nil, name: String? = nil) -> Bool {
		guard let matchingDictionary: CFMutableDictionary =
			className.map({ IOServiceMatching($0) }) ??
			name.map({ IOServiceNameMatching($0) })
		else { return false }
		let service = IOServiceGetMatchingService(kIOMasterPortDefault, matchingDictionary)
		defer { IOObjectRelease(service) }
		return service > 0
	}
}
