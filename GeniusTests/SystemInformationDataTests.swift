//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

@Suite("SystemInformationData")
struct SystemInformationDataTests {

	@Test("SystemInformationData with SyncValueWrapper")
	func systemInformationDataSyncValueWrapper() {
		SystemInformationData<Void?, SyncValueWrapper>(
			#expect(Bool(false)),
			applicable: false,
		).value
	}

	@Test("SystemInformationData with AsyncValueWrapper")
	func systemInformationDataAsyncValueWrapper() async {
		await SystemInformationData<Void?, AsyncValueWrapper>(
			{ #expect(Bool(false)) },
			applicable: false,
		).value
	}
}
