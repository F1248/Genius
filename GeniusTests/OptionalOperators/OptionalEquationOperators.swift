//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

extension OptionalOperators {

	@Suite("Optional equation operators")
	struct OptionalEquationOperators {

		@Test("Optional equal to")
		func optionalEqualTo() {
			#expect((0 ==? 1) == false)
			#expect((0 ==? nil) == nil)
			#expect((nil ==? 0) == nil)
			#expect((nil as Int? ==? nil) == nil)
		}

		@Test("Optional not equal to")
		func optionalNotEqualTo() {
			#expect((0 !=? 1) == true)
			#expect((0 !=? nil) == nil)
			#expect((nil !=? 0) == nil)
			#expect((nil as Int? !=? nil) == nil)
		}
	}
}
