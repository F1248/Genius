//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

extension OptionalOperators {

	struct Logical {

		@Test("!?")
		func optionalNegation() {
			#expect(!?true == false)
			#expect(!?false == true)
			#expect(!?nil == nil)
		}

		@Test("&&?")
		func optionalConjunction() {
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

		@Test("||?")
		func optionalDisjunction() {
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
