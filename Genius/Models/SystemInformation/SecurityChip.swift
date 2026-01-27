//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

enum SecurityChip: Comparable, UIStringRepresentable {

	case absent
	case t1
	case t2
	case mSeries

	var uiRepresentation: String? {
		let localizedStringResource: LocalizedStringResource =
			switch self {
				case .absent: .noneSecurityChip
				case .t1: .appleT1
				case .t2: .appleT2
				case .mSeries: .mSeries
			}
		return String(localized: localizedStringResource)
	}
}
