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
			value >= requirement ? // swiftlint:disable:this void_function_in_ternary
				Symbol(.checkmark, color: .green, label: .enabled) :
				Symbol(.xmark, color: .red, label: .disabled)
		} else {
			Defaults[.developmentMode] || Defaults[.interfaceMode] >= .advanced ?
				Symbol(.questionmark, color: .red, label: .unknown) : nil
		}
	}
}
