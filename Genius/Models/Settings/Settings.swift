//
// Settings.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

enum Settings {

	enum InterfaceMode: String, Comparable, SelfIdentifiable, CaseIterableSetting {

		case verySimple = "Very Simple"
		case simple = "Simple"
		case normal = "Normal"
		case advanced = "Advanced"
		case powerUser = "Power User"

		var index: Int { Self.allCases.firstIndex(of: self) ?? 0 }
		var localizationTable: String { "Localizable\(rawValue.remove(" "))" }

		init() { self = .normal }

		static func < (lhs: Self, rhs: Self) -> Bool {
			lhs.index < rhs.index
		}
	}

	enum DevelopmentMode: WrappedSetting {

		typealias WrappedValue = Bool

		static let defaultValue: WrappedValue = false
	}
}
