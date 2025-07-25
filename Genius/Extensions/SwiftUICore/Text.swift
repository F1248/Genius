//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import SwiftUI

extension Text {

	init(varying key: LocalizedStringKey) {
		self.init(
			key,
			tableName: key.variesByInterfaceMode ? Defaults[.interfaceMode].localizationTable : nil,
		)
	}
}
