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

	var exists: Bool? {
		service >? 0
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

	func read<Wrapped: DataInitializable>(_ key: String) -> Wrapped? {
		guard exists ?? false, let service else { return nil }
		let property = IORegistryEntryCreateCFProperty(service, key as CFString, kCFAllocatorDefault, 0)?.takeRetainedValue()
		return property as? Wrapped ?? ((property as? Data)?.trimmingTrailingZeros).flatMap(Wrapped.init)
	}

	func contains(_ key: String) -> Bool? {
		guard exists ?? false, let service else { return nil }
		return IORegistryEntryCreateCFProperty(service, key as CFString, kCFAllocatorDefault, 0) != nil
	}
}
