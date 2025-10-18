//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension Settings {

	enum AutomaticUpdates: CaseIterable, SelfIdentifiable {

		case disabled
		case checkOnly
		case enabled

		var title: LocalizedStringResource { switch self {
			case .disabled: .disabled
			case .checkOnly: .checkOnlyUpdates
			case .enabled: .enabled
		} }
	}
}
