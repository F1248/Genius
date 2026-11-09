//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import CoreFoundation
import Foundation
import IOKit

struct IORegistry: ~Copyable {

	let service: io_service_t

	var exists: Bool {
		service > 0
	}

	init?(class: String) {
		self.init(matchingDictionary: unsafe IOServiceMatching(`class`))
	}

	init?(name: String) {
		self.init(matchingDictionary: unsafe IOServiceNameMatching(name))
	}

	// swiftformat:disable:next organizeDeclarations
	private init?(matchingDictionary: CFMutableDictionary?) {
		guard let matchingDictionary else { return nil }
		self.service = IOServiceGetMatchingService(kIOMainPortDefault, matchingDictionary)
	}

	deinit {
		if exists { IOObjectRelease(service) }
	}

	func read<Wrapped: DataInitializable>(_ key: String) -> Wrapped? {
		guard exists else { return nil }
		let property: CFTypeRef? = unsafe IORegistryEntryCreateCFProperty(
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
		guard exists else { return nil }
		return unsafe IORegistryEntryCreateCFProperty(
			service,
			key as CFString,
			kCFAllocatorDefault,
			0,
		) != nil
	}
}
