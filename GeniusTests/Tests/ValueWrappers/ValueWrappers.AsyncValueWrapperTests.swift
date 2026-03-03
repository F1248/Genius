//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

extension `Value wrappers` {

	@Suite("AsyncValueWrapper")
	struct AsyncValueWrapperTests { // swiftformat:disable:this swiftTestingTestCaseNames

		@Test("SystemInformationData")
		func systemInformationData() async {
			_ = await SystemInformationData<Int?, AsyncValueWrapper>(
				{
					#expect(Bool(false))
					return nil
				},
				available: false,
			).value
		}

		@Test("MaintenanceCheck")
		func maintenanceCheck() async {
			_ = await MaintenanceCheck<Bool?, AsyncValueWrapper>(
				{
					#expect(Bool(false))
					return nil
				},
				available: false,
			).value
		}
	}
}
