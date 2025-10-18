//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import SwiftUI

struct CustomTab {

	let title: LocalizedStringResource
	let content: AnyView

	init(
		_ title: LocalizedStringResource,
		@ViewBuilder content: () -> some View,
	) {
		self.title = title
		self.content = AnyView(content())
	}
}
