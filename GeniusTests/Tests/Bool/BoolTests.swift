//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

@Suite("Bool")
struct BoolTests {

	@Test
	func Comparable() {
		#expect(false < true)
		#expect(true > false)
	}
}
