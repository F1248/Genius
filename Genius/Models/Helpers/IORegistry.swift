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
			if let className {
				IOServiceMatching(className)
			} else if let name {
				IOServiceNameMatching(name)
			} else { nil }
			// swiftformat:disable indent
		else { return nil }
		let service = IOServiceGetMatchingService(kIOMainPortDefault, matchingDictionary)
		defer { IOObjectRelease(service) }
		guard service > 0 else { return nil }
		let property = IORegistryEntryCreateCFProperty(service, key as CFString, kCFAllocatorDefault, 0)?.takeRetainedValue()
		return property as? W ?? ((property as? Data)?.trimmingTrailingZeros()).flatMap(W.init)
	}

	static func serviceExists(class className: String? = nil, name: String? = nil) -> Bool {
		guard let matchingDictionary: CFMutableDictionary =
			if let className {
				IOServiceMatching(className)
			} else if let name {
				IOServiceNameMatching(name)
			// swiftlint:disable:next statement_position
			} else { nil }
		else { return false }
		let service = IOServiceGetMatchingService(kIOMainPortDefault, matchingDictionary)
		defer { IOObjectRelease(service) }
		return service > 0
	}
}
