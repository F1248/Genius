//
// SystemInformationData.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

struct SystemInformationData<Value: Sendable>: SystemInformationProtocol {

	let value: Value
	let applicable: Bool?

	init(_ value: Value) {
		self.value = value
		self.applicable = true
	}

	init<Wrapped>(_ value: @autoclosure () -> Value, applicable: Bool?) where Value == Wrapped? {
		self.value = applicable ?? true ? value() : nil
		self.applicable = applicable
	}
}

extension SystemInformationData: UIRepresentable, UIRepresentableSystemInformation where Value: UIRepresentable {

	var uiRepresentation: String? {
		value.uiRepresentation
	}
}
