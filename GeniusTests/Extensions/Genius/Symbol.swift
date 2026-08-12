//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
@testable import Genius
import SFSafeSymbols
import SwiftUI

extension Symbol: @retroactive Equatable {

	static let unavailable = Self(.minus, color: .primary, label: .unavailable)
	static let pending = Self(.xmark, color: .red, label: .pending)
	static let resolved = Self(.checkmark, color: .green, label: .resolved)
	static let unknown = Self(.questionmark, color: .red, label: .unknown)

	static func == (lhs: Self, rhs: Self) -> Bool {
		lhs.symbol == rhs.symbol &&
			lhs.color == rhs.color &&
			lhs.label == rhs.label
	}
}
