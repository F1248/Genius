//
// SystemInformationData.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

struct SystemInformationData<T: Sendable>: SystemInformationDataProtocol {

	let value: T

	init(_ value: T) {
		self.value = value
	}

	init<W>(_ value: Any?) where T == W? {
		self.init(value as? W)
	}
}
