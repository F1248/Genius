//
// © 2026 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
@testable import Genius
import SFSafeSymbols
import SwiftUI

extension Recommendation where ValueWrapper == SyncValueWrapper<Value> {

	@MainActor var uiRepresentation: Symbol? {
		if !?available ?? false {
			if Defaults[.developmentMode] {
				Symbol(.minus, color: .primary, label: .unavailable)
			} else { nil }
		} else if let value = value.optional {
			if value >= requirement {
				if Defaults[.showResolvedRecommendations] {
					Symbol(.checkmark, color: .green, label: .resolved)
				} else { nil }
			} else {
				Symbol(.xmark, color: .red, label: .pending)
			}
		} else {
			if Defaults[.developmentMode] || Defaults[.interfaceMode] >= .advanced {
				Symbol(.questionmark, color: .red, label: .unknown)
			} else { nil }
		}
	}
}
