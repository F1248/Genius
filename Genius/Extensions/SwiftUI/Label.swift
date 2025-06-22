//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency
import SFSafeSymbols
import SwiftUI

extension Label {

	@MainActor
	init(_ titleKey: LocalizedStringKey, systemSymbol: SFSymbol) where Title == VaryingText, Icon == Image {
		self.init {
			VaryingText(titleKey)
		} icon: {
			Image(systemSymbol: systemSymbol)
		}
	}
}
