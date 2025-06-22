//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

extension View {

	@ViewBuilder
	func apply(modifier: (Self) -> some View, if condition: Bool) -> some View {
		if condition {
			modifier(self)
		} else {
			self
		}
	}
}
