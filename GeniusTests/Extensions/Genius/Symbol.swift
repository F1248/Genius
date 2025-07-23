//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import SFSafeSymbols
import SwiftUI

extension Symbol: @retroactive Equatable {

	static let notApplicable: Self = Symbol(.minus, color: .primary, label: "Not applicable")
	static let disabled: Self = Symbol(.xmark, color: .red, label: "Disabled")
	static let enabled: Self = Symbol(.checkmark, color: .green, label: "Enabled")
	static let unknown: Self = Symbol(.questionmark, color: .red, label: "Unknown")

	static func == (lhs: Self, rhs: Self) -> Bool {
		lhs.symbol == rhs.symbol &&
			lhs.color == rhs.color &&
			lhs.label == rhs.label
	}
}
