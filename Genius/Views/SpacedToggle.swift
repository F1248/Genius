//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import SwiftUI

struct SpacedToggle: View {

	let label: LocalizedStringResource
	let isOn: Binding<Bool>

	// swiftlint:disable:next type_contents_order
	init(_ label: LocalizedStringResource, isOn: Binding<Bool>) {
		self.label = label
		self.isOn = isOn
	}

	var body: some View {
		Toggle(isOn: isOn) {
			HStack {
				Text(label)
				Spacer()
			}
		}
		.toggleStyle(.switch)
	}
}

#Preview("SpacedToggle off") {
	SpacedToggle("Title", isOn: .constant(false))
		.padding()
}

#Preview("SpacedToggle on") {
	SpacedToggle("Title", isOn: .constant(true))
		.padding()
}
