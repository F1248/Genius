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

	var isContainedInDefaultLocalizationTable: Bool {
		NSLocalizedString(self, value: " ", comment: "") == " "
	}

	var localized: String {
		let tableName: String? = isContainedInDefaultLocalizationTable ? Defaults[.interfaceMode].localizationTable : nil
		return if #available(macOS 12, *) {
			String(localized: LocalizationValue(self), table: tableName)
		} else {
			NSLocalizedString(self, tableName: tableName, comment: "")
		}
	}

	init?(_ string: (some StringProtocol)?) {
		guard let string else { return nil }
		self.init(string)
	}
}
