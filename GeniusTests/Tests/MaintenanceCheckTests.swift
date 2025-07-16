//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

@Suite("MaintenanceCheck")
struct MaintenanceCheckTests {

	@Test("MaintenanceCheck with SyncValueWrapper")
	func systemInformationDataSyncValueWrapper() {
		_ = MaintenanceCheck<Bool?, SyncValueWrapper>(
			{
				#expect(Bool(false))
				return nil
			}(),
			applicable: false,
		).value
	}

	@Test("MaintenanceCheck with AsyncValueWrapper")
	func systemInformationDataAsyncValueWrapper() async {
		_ = await MaintenanceCheck<Bool?, AsyncValueWrapper>(
			{
				#expect(Bool(false))
				return nil
			},
			applicable: false,
		).value
	}
}
