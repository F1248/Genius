//
// Settings.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults

enum Settings {

	enum InterfaceMode: String, CaseIterable, Comparable, SelfIdentifiable, Defaults.Serializable {

		case verySimple = "Very Simple"
		case simple = "Simple"
		case normal = "Normal"
		case advanced = "Advanced"
		case powerUser = "Power User"

		var index: Int { Self.allCases.firstIndex(of: self) ?? 0 }
		var localizationTable: String { "Localizable\(rawValue.remove(" "))" }

		static func < (lhs: Self, rhs: Self) -> Bool {
			lhs.index < rhs.index
		}
	}
}
