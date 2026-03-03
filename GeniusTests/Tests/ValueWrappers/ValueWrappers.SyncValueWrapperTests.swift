//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

extension `Value wrappers` {

	@Suite("SyncValueWrapper")
	struct SyncValueWrapperTests { // swiftformat:disable:this swiftTestingTestCaseNames

		@Test("SystemInformationData")
		func systemInformationData() {
			_ = SystemInformationData<Int?, SyncValueWrapper>(
				{
					#expect(Bool(false))
					return nil
				}(),
				available: false,
			).value
		}

		@Test("MaintenanceCheck")
		func maintenanceCheck() {
			_ = MaintenanceCheck<Bool?, SyncValueWrapper>(
				{
					#expect(Bool(false))
					return nil
				}(),
				available: false,
			).value
		}
	}
}
