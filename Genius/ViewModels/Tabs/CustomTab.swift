//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency
import SwiftUI

struct CustomTab {

	let title: LocalizedStringKey
	let index: Int
	let content: AnyView

	@MainActor
	init(
		_ title: LocalizedStringKey,
		index: Int,
		@ViewBuilder content: () -> some View,
	) {
		self.title = title
		self.index = index
		self.content = AnyView(content())
	}
}
