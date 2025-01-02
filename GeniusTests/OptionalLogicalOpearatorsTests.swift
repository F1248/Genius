//
// OptionalLogicalOpearatorsTests.swift
// GeniusTests
//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

extension OptionalOpearatorsTests {

	struct OptionalLogicalOpearatorsTests {

		@Test
		func optionalNegation() {
			#expect(!?true == false)
			#expect(!?false == true)
			#expect(!?nil == nil)
		}

		@Test
		func optionalConjunction() {
			#expect((true &&? true) == true)
			#expect((false &&? false) == false)
			#expect((false &&? true) == false)
			#expect((true &&? false) == false)
			#expect((false &&? nil) == false)
			#expect((nil &&? false) == false)
			#expect((true &&? nil) == nil)
			#expect((nil &&? true) == nil)
			#expect((nil &&? nil) == nil)
		}

		@Test
		func optionalDisjunction() {
			#expect((false ||? false) == false)
			#expect((true ||? true) == true)
			#expect((true ||? false) == true)
			#expect((false ||? true) == true)
			#expect((true ||? nil) == true)
			#expect((nil ||? true) == true)
			#expect((false ||? nil) == nil)
			#expect((nil ||? false) == nil)
			#expect((nil ||? nil) == nil)
		}
	}
}
