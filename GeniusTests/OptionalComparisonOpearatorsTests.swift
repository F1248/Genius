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

	struct OptionalComparisonOpearatorsTests {

		@Test
		func optionalGreaterThanTests() {
			#expect((1 >? 0) == true)
			#expect((0 >? 1) == false)
			#expect((0 >? nil) == nil)
			#expect((nil >? 0) == nil)
			#expect((nil as Int? >? nil) == nil)
		}

		@Test
		func optionalLessThanTests() {
			#expect((0 <? 1) == true)
			#expect((1 <? 0) == false)
			#expect((0 <? nil) == nil)
			#expect((nil <? 0) == nil)
			#expect((nil as Int? <? nil) == nil)
		}

		@Test
		func optionalGreaterThanOrEqualToTests() {
			#expect((1 >=? 0) == true)
			#expect((0 >=? 1) == false)
			#expect((0 >=? nil) == nil)
			#expect((nil >=? 0) == nil)
			#expect((nil as Int? >=? nil) == nil)
		}

		@Test
		func optionalLessThanOrEqualToTests() {
			#expect((0 <=? 1) == true)
			#expect((1 <=? 0) == false)
			#expect((0 <=? nil) == nil)
			#expect((nil <=? 0) == nil)
			#expect((nil as Int? <=? nil) == nil)
		}
	}
}
