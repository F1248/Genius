//
// Bool.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension Bool: DataInitializable {

	init?(_ data: Data) {
		switch data.first {
			case 0: self = false
			case 1: self = true
			default: return nil
		}
	}

	init?<T: Equatable>(_ value: T?, valuesTrue: T?..., valuesFalse: T?...) {
		if valuesTrue.contains(value) {
			self = true
		} else if valuesFalse.contains(value) {
			self = false
		} else { return nil }
	}

	init?(firmwarepasswdOutput: String?) {
		self.init(
			firmwarepasswdOutput?.betweenAnchored(start: "Password Enabled: "),
			valuesTrue: "Yes",
			valuesFalse: "No"
		)
	}

	// swiftlint:disable vertical_parameter_alignment_on_call
	// swiftformat:disable indent wrap wrapArguments

	init?(fdesetupOutput: String?) {
		self.init(
			fdesetupOutput?.betweenAnchored(start: "FileVault is ", end: "."),
			valuesTrue: "On",
			valuesFalse:
				"On, but needs to be restarted to finish",
				"Off",
				"Off, but needs to be restarted to finish",
				"Off, but will be enabled after the next restart"
		)
	}

	init?(csrutilOutput: String?) {
		self.init(
			csrutilOutput?.firstLine?.betweenAnchored(start: "System Integrity Protection status: ", end: "."),
			valuesTrue: "enabled",
			valuesFalse:
				"enabled (Apple Internal)",
				"disabled",
				"disabled (Apple Internal)",
				"unknown (Custom Configuration)"
		)
	}

	// swiftlint:enable vertical_parameter_alignment_on_call

	init?(socketfilterfwOutput: String?) {
		self.init(
			socketfilterfwOutput?.betweenAnchored(start: "Firewall is "),
			valuesTrue: "enabled. (State = 1)",
			valuesFalse: "disabled. (State = 0)"
		)
	}

	init?(spctlOutput: String?) {
		self.init(
			spctlOutput?.betweenAnchored(start: "assessments "),
			valuesTrue: "enabled",
			valuesFalse: "disabled"
		)
	}
}

extension Bool? {

	static prefix func !? (bool: Self) -> Self {
		bool.map(!)
	}

	static func &&? (lhs: Self, rhs: @autoclosure () -> Self) -> Self {
		switch lhs {
			case true: rhs()
			case false: false
			default: rhs() == false ? false : nil
		}
	}

	static func ||? (lhs: Self, rhs: @autoclosure () -> Self) -> Self {
		switch lhs {
			case true: true
			case false: rhs()
			default: rhs() == true ? true : nil
		}
	}
}
