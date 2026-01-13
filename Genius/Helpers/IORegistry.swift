//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import CoreFoundation
import Foundation
import IOKit

struct IORegistry: ~Copyable {

	let matchingDictionary: CFMutableDictionary?

	var service: io_service_t? {
		matchingDictionary.map { IOServiceGetMatchingService(kIOMainPortDefault, $0) }
	}

	var exists: Bool? {
		service >? 0
	}

	init(class: String) {
		self.matchingDictionary = unsafe IOServiceMatching(`class`)
	}

	init(name: String) {
		self.matchingDictionary = unsafe IOServiceNameMatching(name)
	}

	deinit {
		if let service { IOObjectRelease(service) }
	}

	func read<Wrapped: DataInitializable>(_ key: String) -> Wrapped? {
		guard exists ?? false, let service else { return nil }
		let property: CFTypeRef? =
			unsafe IORegistryEntryCreateCFProperty(
				service,
				key as CFString,
				kCFAllocatorDefault,
				0,
			)?.takeRetainedValue()
		return property as? Wrapped ?? ((property as? Data)?.trimmingTrailingZeros).flatMap(Wrapped.init)
	}

	// periphery:ignore
	// swiftlint:disable:next unused_declaration
	func contains(_ key: String) -> Bool? {
		guard exists ?? false, let service else { return nil }
		return unsafe IORegistryEntryCreateCFProperty(
			service,
			key as CFString,
			kCFAllocatorDefault,
			0,
		) != nil
	}
}
