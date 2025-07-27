//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

enum BootMode: UIStringRepresentable {

	case normal
	case safe
	case recovery

	nonisolated var uiRepresentation: String? {
		String(localized: { switch self {
			case .normal: .bootModeNormal
			case .safe: .bootModeSafe
			case .recovery: .bootModeRecovery
		}}())
	}
}
