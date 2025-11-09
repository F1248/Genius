//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
@testable import Genius
import SFSafeSymbols
import SwiftUI

extension Symbol: @retroactive Equatable {

	static let notApplicable = Self(.minus, color: .primary, label: .notApplicable)
	static let disabled = Self(.xmark, color: .red, label: .disabled)
	static let enabled = Self(.checkmark, color: .green, label: .enabled)
	static let unknown = Self(.questionmark, color: .red, label: .unknown)

	static func == (lhs: Self, rhs: Self) -> Bool {
		lhs.symbol == rhs.symbol &&
			lhs.color == rhs.color &&
			lhs.label == rhs.label
	}
}
