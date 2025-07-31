//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

@Suite("Bool")
struct BoolTests {

	@Test("Comparable")
	func comparable() {
		#expect(false < true)
		#expect(true > false)
	}
}
