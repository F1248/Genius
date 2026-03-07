//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
@testable import Genius
import Testing

extension MaintenanceCheckTests {

	struct uiRepresentation {

		@Test
		@MainActor
		func `Development mode disabled, interface mode normal`() {
			Defaults[.developmentMode] = false
			Defaults[.interfaceMode] = .normal
			#expect(MaintenanceCheck<Bool?, _>(nil, available: false).uiRepresentation == nil)
			#expect(MaintenanceCheck<Bool?, _>(false, available: true).uiRepresentation == .failed)
			#expect(MaintenanceCheck<Bool?, _>(true, available: true).uiRepresentation == .passed)
			#expect(MaintenanceCheck<Bool?, _>(nil, available: true).uiRepresentation == nil)
		}

		@Test
		@MainActor
		func `Development mode disabled, interface mode advanced`() {
			Defaults[.developmentMode] = false
			Defaults[.interfaceMode] = .advanced
			#expect(MaintenanceCheck<Bool?, _>(nil, available: false).uiRepresentation == nil)
			#expect(MaintenanceCheck<Bool?, _>(false, available: true).uiRepresentation == .failed)
			#expect(MaintenanceCheck<Bool?, _>(true, available: true).uiRepresentation == .passed)
			#expect(MaintenanceCheck<Bool?, _>(nil, available: true).uiRepresentation == .unknown)
		}

		@Test
		@MainActor
		func `Development mode enabled`() {
			Defaults[.developmentMode] = true
			#expect(MaintenanceCheck<Bool?, _>(nil, available: false).uiRepresentation == .unavailable)
			#expect(MaintenanceCheck<Bool?, _>(false, available: true).uiRepresentation == .failed)
			#expect(MaintenanceCheck<Bool?, _>(true, available: true).uiRepresentation == .passed)
			#expect(MaintenanceCheck<Bool?, _>(nil, available: true).uiRepresentation == .unknown)
		}
	}
}
