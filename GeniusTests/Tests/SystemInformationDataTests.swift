//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

@Suite("SystemInformationData")
struct SystemInformationDataTests {

	@Test("SystemInformationData with SyncValueWrapper")
	func systemInformationDataWithSyncValueWrapper() {
		_ = SystemInformationData<Int?, SyncValueWrapper>(
			{
				#expect(Bool(false))
				return nil
			}(),
			applicable: false,
		).value
	}

	@Test("SystemInformationData with AsyncValueWrapper")
	func systemInformationDataWithAsyncValueWrapper() async {
		_ = await SystemInformationData<Int?, AsyncValueWrapper>(
			{
				#expect(Bool(false))
				return nil
			},
			applicable: false,
		).value
	}
}
