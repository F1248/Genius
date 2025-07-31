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
			#expect(await SystemInformationData<Int, _>(0 as Int).testCondition == true)
			#expect(await SystemInformationData<Int?, _>(0, applicable: true).testCondition == true)
			#expect(await SystemInformationData<Int?, _>(nil, applicable: true).testCondition == false)
			#expect(await SystemInformationData<Int?, _>(0, applicable: false).testCondition == true)
			#expect(await SystemInformationData<Int?, _>(nil, applicable: false).testCondition == true)
			#expect(await SystemInformationData<Int?, _>(0, applicable: nil).testCondition == false)
			#expect(await SystemInformationData<Int?, _>(nil, applicable: nil).testCondition == false)
		}

		@Test("MaintenanceCheck")
		func maintenanceCheck() async {
			#expect(await MaintenanceCheck<Bool, _>(false as Bool).testCondition == true)
			#expect(await MaintenanceCheck<Bool?, _>(false, applicable: true).testCondition == true)
			#expect(await MaintenanceCheck<Bool?, _>(nil, applicable: true).testCondition == false)
			#expect(await MaintenanceCheck<Bool?, _>(false, applicable: false).testCondition == true)
			#expect(await MaintenanceCheck<Bool?, _>(nil, applicable: false).testCondition == true)
			#expect(await MaintenanceCheck<Bool?, _>(false, applicable: nil).testCondition == false)
			#expect(await MaintenanceCheck<Bool?, _>(nil, applicable: nil).testCondition == false)
		}
	}
}
