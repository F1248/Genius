//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

extension LocalizedStringKey {

	var variesByInterfaceMode: Bool {
		(Mirror(reflecting: self).children.first { $0.label == "key" }?.value as? String)
			.safeForceUnwrapped()
			.variesByInterfaceMode
	}
}
