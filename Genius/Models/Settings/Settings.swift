//
// Settings.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults

enum Settings {

	enum InterfaceMode: String, CaseIterable, IndexComparable, SelfIdentifiable, Defaults.Serializable {

		case simple = "Simple"
		case normal = "Normal"
		case advanced = "Advanced"
		case powerUser = "Power User"

		var localizationTable: String { "Localizable\(rawValue.remove(" "))" }
	}
}
