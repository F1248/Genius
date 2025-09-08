//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

enum CPUType: UIStringRepresentable {

	case intel
	case appleSilicon

	var uiRepresentation: String? {
		let localizedStringResource: LocalizedStringResource =
			switch self {
				case .intel: .intel
				case .appleSilicon: .appleSilicon
			}
		return String(localized: localizedStringResource)
	}
}
