//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

enum SecurityChip: Comparable, UIStringRepresentable {

	case none
	case t1
	case t2
	case mSeries

	nonisolated var uiRepresentation: String? {
		String(localized: { switch self {
			case .none: .noneSecurityChip
			case .t1: .appleT1
			case .t2: .appleT2
			case .mSeries: .mSeries
		}}())
	}
}
