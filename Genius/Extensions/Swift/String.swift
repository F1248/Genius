//
// String.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import Foundation

extension String: DefaultInitializable, DataInitializable, UIStringRepresentable {

	var uiRepresentation: String? {
		self
	}

	var variesByInterfaceMode: Bool {
		NSLocalizedString(self, tableName: "LocalizableNormal", value: " ", comment: "") != " "
	}

	var localized: String {
		String(
			localized: LocalizationValue(self),
			table: variesByInterfaceMode ? Defaults[.interfaceMode].localizationTable : nil,
		)
	}
}
