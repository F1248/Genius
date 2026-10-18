//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

extension Picker {

	init(selection: Binding<SelectionValue>, @ContentBuilder content: () -> Content) where Label == EmptyView {
		self.init(selection: selection, content: content, label: {})
	}
}
