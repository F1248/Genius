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
		func Unavailable() {
			Defaults[.developmentMode] = false
			#expect(MaintenanceCheck<Bool?, _>(nil, available: false).uiRepresentation == nil)

			Defaults[.developmentMode] = true
			#expect(MaintenanceCheck<Bool?, _>(nil, available: false).uiRepresentation == .unavailable)
		}

		@Test
		@MainActor
		func Failed() {
			#expect(MaintenanceCheck<Bool?, _>(false, available: true).uiRepresentation == .failed)
		}

		@Test
		@MainActor
		func Passed() {
			Defaults[.showPassedMaintenanceChecks] = false
			#expect(MaintenanceCheck<Bool?, _>(true, available: true).uiRepresentation == nil)

			Defaults[.showPassedMaintenanceChecks] = true
			#expect(MaintenanceCheck<Bool?, _>(true, available: true).uiRepresentation == .passed)
		}

		@Test
		@MainActor
		func Unknown() {
			Defaults[.developmentMode] = false
			Defaults[.interfaceMode] = .normal
			#expect(MaintenanceCheck<Bool?, _>(nil, available: true).uiRepresentation == nil)

			Defaults[.developmentMode] = false
			Defaults[.interfaceMode] = .advanced
			#expect(MaintenanceCheck<Bool?, _>(nil, available: true).uiRepresentation == .unknown)

			Defaults[.developmentMode] = true
			Defaults[.interfaceMode] = .normal
			#expect(MaintenanceCheck<Bool?, _>(nil, available: true).uiRepresentation == .unknown)
		}
	}
}
