//
// © 2026 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
@testable import Genius
import SFSafeSymbols
import SwiftUI

extension MaintenanceCheck where ValueWrapper == SyncValueWrapper<Value> {

	@MainActor var uiRepresentation: Symbol? {
		if !?available ?? false {
			Defaults[.developmentMode] ? Symbol(.minus, color: .primary, label: .notAvailable) : nil
		} else if let value = value.optional {
			if value >= requirement {
				Defaults[.showPassedMaintenanceChecks] ? Symbol(.checkmark, color: .green, label: .passed) : nil
			} else {
				Symbol(.xmark, color: .red, label: .failed)
			}
		} else {
			Defaults[.developmentMode] || Defaults[.interfaceMode] >= .advanced ?
				Symbol(.questionmark, color: .red, label: .unknown) : nil
		}
	}
}
