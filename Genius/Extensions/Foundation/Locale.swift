//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension Locale {

	static let currentLanguageCode: String? =
		if #available(macOS 13, *) {
			Locale.current.language.languageCode?.identifier
		} else {
			Locale.current.languageCode
		}
}
