//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import Foundation
import SFSafeSymbols
import SwiftUI

struct Symbol: View {

	let symbol: SFSymbol
	let color: Color?
	let label: LocalizedStringResource

	@Default(.useTextInsteadOfSymbols)
	var useTextInsteadOfSymbols: Bool

	// swiftlint:disable:next type_contents_order
	init(
		_ symbol: SFSymbol,
		color: Color? = nil,
		label: LocalizedStringResource,
	) {
		self.symbol = symbol
		self.color = color
		self.label = label
	}

	var body: some View {
		if useTextInsteadOfSymbols {
			Text(label)
		} else {
			Image(systemSymbol: symbol)
				.apply(modifier: { $0.foregroundColor(color) }, if: color != nil)
				.frame(width: 14)
				.accessibilityLabel(label)
		}
	}
}

#Preview {
	Symbol(.character, color: .red, label: "Label")
		.padding()
}
