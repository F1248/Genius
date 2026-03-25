//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension Bool: @retroactive Comparable, Maximizable, PossiblyOptional, DataInitializable {

	static var max: Self { true }

	init?(_ data: Data) {
		switch data.first {
			case 0: self = false
			case 1: self = true
			default: return nil
		}
	}

	init?(systemProfilerActivationLockStatusOutput: (any Sendable)?) {
		switch (systemProfilerActivationLockStatusOutput as? String)?.betweenAnchored(start: "activation_lock_") {
			case "enabled": self = true
			case "disabled": self = false
			default: return nil
		}
	}

	init?(firmwarepasswdOutput: String?) {
		switch firmwarepasswdOutput?.betweenAnchored(start: "Password Enabled: ") {
			case "Yes": self = true
			case "No": self = false
			default: return nil
		}
	}

	init?(fdesetupOutput: String?) {
		switch fdesetupOutput?.betweenAnchored(start: "FileVault is ", end: ".") {
			case "On": self = true
			case "On, but needs to be restarted to finish": self = false
			case "Off": self = false
			case "Off, but needs to be restarted to finish": self = false
			case "Off, but will be enabled after the next restart": self = false
			default: return nil
		}
	}

	init?(csrutilOutput: String?) {
		switch csrutilOutput?.firstLine?.betweenAnchored(start: "System Integrity Protection status: ", end: ".") {
			case "enabled": self = true
			case "enabled (Apple Internal)": self = false
			case "disabled": self = false
			case "disabled (Apple Internal)": self = false
			case "unknown (Custom Configuration)": self = false
			default: return nil
		}
	}

	init?(socketfilterfwOutput: String?) {
		switch socketfilterfwOutput?.betweenAnchored(start: "Firewall is ") {
			case "enabled. (State = 1)": self = true
			case "disabled. (State = 0)": self = false
			default: return nil
		}
	}

	init?(spctlOutput: String?) {
		switch spctlOutput?.betweenAnchored(start: "assessments ") {
			case "enabled": self = true
			case "disabled": self = false
			default: return nil
		}
	}

	public static func < (lhs: Self, rhs: Self) -> Bool {
		!lhs && rhs
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
			case nil: rhs() == false ? false : nil
		}
	}

	static func ||? (lhs: Self, rhs: @autoclosure () -> Self) -> Self {
		switch lhs {
			case true: true
			case false: rhs()
			case nil: rhs() == true ? true : nil
		}
	}
}
