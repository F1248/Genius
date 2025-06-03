//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

extension SystemInformationTests {

	@Suite("testCondition")
	struct TestCondition {

		@Test("Optional")
		func optional() {
			#expect((() as Void?).testCondition == true)
			#expect((nil as Void?).testCondition == false)
		}

		@Test("SystemInformationData")
		func systemInformationData() async {
			#expect(await SystemInformationData<Void, _>(()).testCondition == true)
			#expect(await SystemInformationData<Void?, _>((), applicable: true).testCondition == true)
			#expect(await SystemInformationData<Void?, _>(nil, applicable: true).testCondition == false)
			#expect(await SystemInformationData<Void?, _>((), applicable: false).testCondition == true)
			#expect(await SystemInformationData<Void?, _>(nil, applicable: false).testCondition == true)
			#expect(await SystemInformationData<Void?, _>((), applicable: nil).testCondition == false)
			#expect(await SystemInformationData<Void?, _>(nil, applicable: nil).testCondition == false)
		}
	}
}
