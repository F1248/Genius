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

	@Suite("Optional logical operators tests")
	struct OptionalLogicalOpearatorsTests {

		@Test("Optional negation tests")
		func optionalNegationTests() {
			#expect(!?true == false)
			#expect(!?false == true)
			#expect(!?nil == nil)
		}

		@Test("Optional conjunction tests")
		func optionalConjunctionTests() {
			#expect((true &&? true) == true)
			#expect((true &&? false) == false)
			#expect((true &&? nil) == nil)
			#expect((false &&? true) == false)
			#expect((false &&? false) == false)
			#expect((false &&? nil) == false)
			#expect((nil &&? true) == nil)
			#expect((nil &&? false) == false)
			#expect((nil &&? nil) == nil)
			_ = false &&? {
				#expect(Bool(false))
				return nil
			}()
		}

		@Test("Optional disjunction tests")
		func optionalDisjunctionTests() {
			#expect((true ||? true) == true)
			#expect((true ||? false) == true)
			#expect((true ||? nil) == true)
			#expect((false ||? true) == true)
			#expect((false ||? false) == false)
			#expect((false ||? nil) == nil)
			#expect((nil ||? true) == true)
			#expect((nil ||? false) == nil)
			#expect((nil ||? nil) == nil)
			_ = true ||? {
				#expect(Bool(false))
				return nil
			}()
		}
	}
}
