//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import ObjectiveC

extension NSObjectProtocol {

	func performSafe(_ selector: Selector) -> AnyObject? {
		guard responds(to: selector) else { return nil }
		return unsafe perform(selector)?.takeUnretainedValue()
	}
}
