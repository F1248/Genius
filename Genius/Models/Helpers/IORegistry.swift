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
		let service = IOServiceGetMatchingService(kIOMasterPortDefault, matchingDictionary)
		guard service > 0 else { return nil }
		return service
	}

	init(class className: String) {
		self.matchingDictionary = IOServiceMatching(className)
	}

	init(name: String) {
		self.matchingDictionary = IOServiceNameMatching(name)
	}

	func read<W: DataInitializable>(_ key: String) -> W? {
		guard let service else { return nil }
		let property = IORegistryEntryCreateCFProperty(service, key as CFString, kCFAllocatorDefault, 0)?.takeRetainedValue()
		return property as? W ?? ((property as? Data)?.trimmingTrailingZeros()).flatMap(W.init)
	}

	func serviceExists() -> Bool {
		service != nil
	}

	// swiftformat:disable organizeDeclarations
	deinit {
		if let service { IOObjectRelease(service) }
	}
}
