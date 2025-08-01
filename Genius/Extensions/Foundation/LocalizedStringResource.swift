//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension LocalizedStringResource {

	static var supportsInflection: Bool {
		if #available(macOS 26, *) {
			true
		} else {
			(SystemInformation.Software.OS.bootMode.value !=? .recovery) ?? false
		}
	}

	static var user: Self { supportsInflection ? .userWithInflection : .userWithoutInflection }
}
