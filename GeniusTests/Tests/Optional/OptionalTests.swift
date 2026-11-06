//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Testing

@Suite("Optional")
struct OptionalTests {

	@Test
	func test() {
		#expect((() as Void?).test == true)
		#expect((nil as Void?).test == false)
	}
}
