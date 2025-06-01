//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

extension [Int] {

	init?(_ strings: [some StringProtocol]) {
		self = strings.compactMap { Int($0) }
		guard self.count == strings.count else { return nil }
	}
}
