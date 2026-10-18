//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

extension View {

	func apply(@ContentBuilder modifier: (Self) -> some View) -> some View {
		modifier(self)
	}
}
