//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

enum BootMode: UIStringRepresentable {

	case normal
	case safe
	case recovery

	var uiRepresentation: String? {
		let localizedStringResource: LocalizedStringResource =
			switch self {
				case .normal: .bootModeNormal
				case .safe: .bootModeSafe
				case .recovery: .bootModeRecovery
			}
		return String(localized: localizedStringResource)
	}
}
