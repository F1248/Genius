//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import AppKit
import Foundation
import SwiftUI

extension String: DataInitializable, UIStringRepresentable, FormValue {

	var uiRepresentation: String? {
		self
	}

	// swiftlint:disable:next type_contents_order
	init?(data: Data) {
		self.init(data: data.prefix { $0 != 0 }, encoding: .utf8)
	}

	var formView: some View {
		Button(self) {
			NSPasteboard.set(self)
		}
		.buttonStyle(.borderless)
	}
}
