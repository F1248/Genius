//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import Foundation

extension String: DataInitializable, UIStringRepresentable {

	nonisolated var uiRepresentation: String? {
		self
	}

	var variesByInterfaceMode: Bool {
		NSLocalizedString(self, value: " ", comment: "") == " "
	}

	var localized: String {
		String(
			localized: LocalizationValue(self),
			table: variesByInterfaceMode ? Defaults[.interfaceMode].localizationTable : nil,
		)
	}
}
