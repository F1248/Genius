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

	var formView: some View {
		Button(self) {
			NSPasteboard.set(self)
		}
		.buttonStyle(.borderless)
	}

	init?(data: Data) {
		self.init(data: data, encoding: .utf8)
	}
}
