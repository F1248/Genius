//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency
import Defaults
@testable import Genius
import Testing

extension MaintenanceCheckTests {

	@Suite("uiRepresentation")
	struct UIRepresentation {

		@Test("Development mode disabled, interface mode normal")
		@MainActor
		func developmentModeDisabledInterfaceModeNormal() {
			Defaults[.developmentMode] = false
			Defaults[.interfaceMode] = .normal
			#expect(MaintenanceCheck<Bool?, _>(nil, available: false).uiRepresentation == nil)
			#expect(MaintenanceCheck<Bool?, _>(false, available: true).uiRepresentation == .disabled)
			#expect(MaintenanceCheck<Bool?, _>(true, available: true).uiRepresentation == .enabled)
			#expect(MaintenanceCheck<Bool?, _>(nil, available: true).uiRepresentation == nil)
		}

		@Test("Development mode disabled, interface mode advanced")
		@MainActor
		func developmentModeDisabledInterfaceModeAdvanced() {
			Defaults[.developmentMode] = false
			Defaults[.interfaceMode] = .advanced
			#expect(MaintenanceCheck<Bool?, _>(nil, available: false).uiRepresentation == nil)
			#expect(MaintenanceCheck<Bool?, _>(false, available: true).uiRepresentation == .disabled)
			#expect(MaintenanceCheck<Bool?, _>(true, available: true).uiRepresentation == .enabled)
			#expect(MaintenanceCheck<Bool?, _>(nil, available: true).uiRepresentation == .unknown)
		}

		@Test("Development mode enabled")
		@MainActor
		func developmentModeEnabled() {
			Defaults[.developmentMode] = true
			#expect(MaintenanceCheck<Bool?, _>(nil, available: false).uiRepresentation == .notAvailable)
			#expect(MaintenanceCheck<Bool?, _>(false, available: true).uiRepresentation == .disabled)
			#expect(MaintenanceCheck<Bool?, _>(true, available: true).uiRepresentation == .enabled)
			#expect(MaintenanceCheck<Bool?, _>(nil, available: true).uiRepresentation == .unknown)
		}
	}
}
