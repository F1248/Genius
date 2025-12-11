//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Testing

@Suite("Optional")
struct OptionalTests {

	@Test
	func testCondition() { // swiftformat:disable:this swiftTestingTestCaseNames
		#expect((() as Void?).testCondition == true)
		#expect((nil as Void?).testCondition == false)
	}
}
