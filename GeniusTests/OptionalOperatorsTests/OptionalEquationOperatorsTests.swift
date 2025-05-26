//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

extension OptionalOperatorsTests {

	@Suite("Optional equation operators tests")
	struct OptionalEquationOperatorsTests {

		@Test("Optional equal to tests")
		func optionalEqualToTests() {
			#expect((0 ==? 1) == false)
			#expect((0 ==? nil) == nil)
			#expect((nil ==? 0) == nil)
			#expect((nil as Int? ==? nil) == nil)
		}

		@Test("Optional not equal to tests")
		func optionalNotEqualToTests() {
			#expect((0 !=? 1) == true)
			#expect((0 !=? nil) == nil)
			#expect((nil !=? 0) == nil)
			#expect((nil as Int? !=? nil) == nil)
		}
	}
}
