//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import CoreFoundation
import Foundation
import IOKit

struct IORegistry: ~Copyable {

	// swiftlint:disable:next explicit_type_interface
	static let nvramVariablesClassName =
		switch SystemInformation.Hardware.CPU.type.value {
			case .appleSilicon: "IODTNVRAMVariables"
			case .intel: "AppleEFINVRAM"
		}

	let matchingDictionary: CFMutableDictionary?

	var service: UInt32? {
		matchingDictionary.map { IOServiceGetMatchingService(kIOMasterPortDefault, $0) }
	}

	var exists: Bool? {
		service >? 0
	}

	init(class className: String) {
		self.matchingDictionary = unsafe IOServiceMatching(className)
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
			unsafe IORegistryEntryCreateCFProperty(service, key as CFString, kCFAllocatorDefault, 0)?.takeRetainedValue()
		return property as? Wrapped ?? ((property as? Data)?.trimmingTrailingZeros).flatMap(Wrapped.init)
	}

	func contains(_ key: String) -> Bool? {
		guard exists ?? false, let service else { return nil }
		return unsafe IORegistryEntryCreateCFProperty(service, key as CFString, kCFAllocatorDefault, 0) != nil
	}
}
