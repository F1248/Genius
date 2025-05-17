//
// SystemInformationDataTests.swift
// GeniusTests
//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

@Suite("SystemInformationData tests")
struct SystemInformationDataTests {

	@Test("SystemInformationData with SyncValueWrapper tests")
	func systemInformationDataSyncValueWrapperTests() {
		SystemInformationData<Void?, SyncValueWrapper>(
			#expect(Bool(false)),
			applicable: false,
		).value
	}

	@Test("SystemInformationData with AsyncValueWrapper tests")
	func systemInformationDataAsyncValueWrapperTests() async {
		await SystemInformationData<Void?, AsyncValueWrapper>(
			{ #expect(Bool(false)) },
			applicable: false,
		).value
	}
}
