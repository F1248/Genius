//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import Foundation

extension Settings {

	enum InterfaceMode: String, CaseIterable, IndexComparable, SelfIdentifiable, Defaults.Serializable {

		case simple = "Simple"
		case normal = "Normal"
		case advanced = "Advanced"
		case powerUser = "PowerUser"

		var title: LocalizedStringResource { switch self {
			case .simple: .interfaceModeSimple
			case .normal: .interfaceModeNormal
			case .advanced: .interfaceModeAdvanced
			case .powerUser: .interfaceModePowerUser
		} }

		var localizationTable: any VaryingLocalizationTable.Type { switch self {
			case .simple: LocalizedStringResource.LocalizableSimple.self
			case .normal: LocalizedStringResource.LocalizableNormal.self
			case .advanced: LocalizedStringResource.LocalizableAdvanced.self
			case .powerUser: LocalizedStringResource.LocalizablePowerUser.self
		} }
	}
}
