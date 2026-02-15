//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

extension View {

	@ViewBuilder
	func apply(if condition: Bool = true, @ViewBuilder modifier: (Self) -> some View) -> some View {
		if condition {
			modifier(self)
		} else {
			self
		}
	}
}
