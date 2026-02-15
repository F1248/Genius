//
// © 2026 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

extension Scene {

	func customWindowToolbarLabelStyleFixedIconOnly() -> some Scene {
		if #available(macOS 15, *) {
			return windowToolbarLabelStyle(fixed: .iconOnly)
		} else {
			return self
		}
	}
}
