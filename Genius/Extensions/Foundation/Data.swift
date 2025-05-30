//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension Data {

	var trimmingTrailingZeros: Data {
		lastIndex { $0 != 0 }.map { prefix(upTo: $0 + 1) } ?? Data()
	}

	init?(_ string: some StringProtocol) {
		guard let data = string.data(using: .utf8) else { return nil }
		self = data
	}
}
