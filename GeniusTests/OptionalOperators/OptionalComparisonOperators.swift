//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

extension OptionalOperators {

	@Suite("Optional comparison operators")
	struct OptionalComparisonOperators {

		@Test("Optional greater than")
		func optionalGreaterThan() {
			#expect((1 >? 0) == true)
			#expect((0 >? 1) == false)
			#expect((0 >? nil) == nil)
			#expect((nil >? 0) == nil)
			#expect((nil as Int? >? nil) == nil)
		}

		@Test("Optional less than")
		func optionalLessThan() {
			#expect((0 <? 1) == true)
			#expect((1 <? 0) == false)
			#expect((0 <? nil) == nil)
			#expect((nil <? 0) == nil)
			#expect((nil as Int? <? nil) == nil)
		}

		@Test("Optional greater than or equal to")
		func optionalGreaterThanOrEqualTo() {
			#expect((1 >=? 0) == true)
			#expect((0 >=? 1) == false)
			#expect((0 >=? nil) == nil)
			#expect((nil >=? 0) == nil)
			#expect((nil as Int? >=? nil) == nil)
		}

		@Test("Optional less than or equal to")
		func optionalLessThanOrEqualTo() {
			#expect((0 <=? 1) == true)
			#expect((1 <=? 0) == false)
			#expect((0 <=? nil) == nil)
			#expect((nil <=? 0) == nil)
			#expect((nil as Int? <=? nil) == nil)
		}
	}
}
