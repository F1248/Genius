//
// OptionalComparisonOpearatorsTests.swift
// GeniusTests
//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

extension OptionalOpearatorsTests {

	@Suite("Optional comparison operators tests")
	struct OptionalComparisonOpearatorsTests {

		@Test("Optional greater than tests")
		func optionalGreaterThanTests() {
			#expect((1 >? 0) == true)
			#expect((0 >? 1) == false)
			#expect((0 >? nil) == nil)
			#expect((nil >? 0) == nil)
			#expect((nil as Int? >? nil) == nil)
		}

		@Test("Optional less than tests")
		func optionalLessThanTests() {
			#expect((0 <? 1) == true)
			#expect((1 <? 0) == false)
			#expect((0 <? nil) == nil)
			#expect((nil <? 0) == nil)
			#expect((nil as Int? <? nil) == nil)
		}

		@Test("Optional greater than or equal to tests")
		func optionalGreaterThanOrEqualToTests() {
			#expect((1 >=? 0) == true)
			#expect((0 >=? 1) == false)
			#expect((0 >=? nil) == nil)
			#expect((nil >=? 0) == nil)
			#expect((nil as Int? >=? nil) == nil)
		}

		@Test("Optional less than or equal to")
		func optionalLessThanOrEqualToTests() {
			#expect((0 <=? 1) == true)
			#expect((1 <=? 0) == false)
			#expect((0 <=? nil) == nil)
			#expect((nil <=? 0) == nil)
			#expect((nil as Int? <=? nil) == nil)
		}
	}
}
