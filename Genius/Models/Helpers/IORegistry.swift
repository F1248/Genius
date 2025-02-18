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

struct IORegistry: ~Copyable {

	let matchingDictionary: CFMutableDictionary?

	var service: UInt32? {
		guard let matchingDictionary else { return nil }
		return IOServiceGetMatchingService(kIOMasterPortDefault, matchingDictionary)
	}

	init(class className: String) {
		self.matchingDictionary = IOServiceMatching(className)
	}

	init(name: String) {
		self.matchingDictionary = IOServiceNameMatching(name)
	}

	deinit {
		if let service { IOObjectRelease(service) }
	}

	func serviceExists() -> Bool? {
		service >? 0
	}

	func read<Wrapped: DataInitializable>(_ key: String) -> Wrapped? {
		guard serviceExists() ?? false, let service else { return nil }
		let property = IORegistryEntryCreateCFProperty(service, key as CFString, kCFAllocatorDefault, 0)?.takeRetainedValue()
		return property as? Wrapped ?? ((property as? Data)?.trimmingTrailingZeros()).flatMap(Wrapped.init)
	}

	func keyExists(_ key: String) -> Bool? {
		guard serviceExists() ?? false, let service else { return nil }
		return IORegistryEntryCreateCFProperty(service, key as CFString, kCFAllocatorDefault, 0) != nil
	}
}
