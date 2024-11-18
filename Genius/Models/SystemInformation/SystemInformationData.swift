//
// SystemInformationData.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

struct SystemInformationData<T: Sendable>: SystemInformationDataProtocol {

	let value: T
	let applicable: Bool

	init(_ value: T) {
		self.value = value
		self.applicable = true
	}

	init<W>(_ value: Any?) where T == W? {
		self.init(value as? W)
	}

	init<W>(_ value: () -> T, applicable: Bool) where T == W? {
		self.value = applicable ? value() : nil
		self.applicable = applicable
	}

	init<W>(_ value: () -> Any?, applicable: Bool) where T == W? {
		self.value = applicable ? value() as? W : nil
		self.applicable = applicable
	}
}
