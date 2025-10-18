//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import Foundation

extension LocalizedStringResource: VaryingLocalizationTable {

	static var localizationTable: any VaryingLocalizationTable.Type { Defaults[.interfaceMode].localizationTable }
	static var supportsInflection: Bool {
		if #available(macOS 26, *) {
			true
		} else {
			(SystemInformation.Software.OS.bootMode.value !=? .recovery) ?? false
		}
	}

	static var administratorPrivilegesRequest: Self { localizationTable.administratorPrivilegesRequest }
	static var askToAllowAccessoriesToConnect: Self { localizationTable.askToAllowAccessoriesToConnect }
	static var automaticUpdates: Self { localizationTable.automaticUpdates }
	static var bootMode: Self { localizationTable.bootMode }
	static var bootVolume: Self { localizationTable.bootVolume }
	static var checkForMacOSUpdates: Self { localizationTable.checkForMacOSUpdates }
	static var checkForUpdatesEllipsis: Self { localizationTable.checkForUpdatesEllipsis }
	static var cpuFrequency: Self { localizationTable.cpuFrequency }
	static var cpuName: Self { localizationTable.cpuName }
	static var cpuType: Self { localizationTable.cpuType }
	static var downloadMacOSUpdates: Self { localizationTable.downloadMacOSUpdates }
	static var installAppStoreAppUpdates: Self { localizationTable.installAppStoreAppUpdates }
	static var installConfigurationDataUpdates: Self { localizationTable.installConfigurationDataUpdates }
	static var installCriticalUpdates: Self { localizationTable.installCriticalUpdates }
	static var installMacOSUpdates: Self { localizationTable.installMacOSUpdates }
	static var malwareProtection: Self { localizationTable.malwareProtection }
	static var systemInformation: Self { localizationTable.systemInformation }
	static var uninstallApp: Self { localizationTable.uninstallApp }
	static var uninstallAppEllipsis: Self { localizationTable.uninstallAppEllipsis }
	static var uninstallationMessage: Self { localizationTable.uninstallationMessage }
	static var uninstallationTitle: Self { localizationTable.uninstallationTitle }
	static var updateInProgressMessage: Self { localizationTable.updateInProgressMessage }
	static var updateInProgressTitle: Self { localizationTable.updateInProgressTitle }

	static var user: Self { supportsInflection ? .userWithInflection : .userWithoutInflection }
}

extension LocalizedStringResource.LocalizableSimple: VaryingLocalizationTable {}
extension LocalizedStringResource.LocalizableNormal: VaryingLocalizationTable {}
extension LocalizedStringResource.LocalizableAdvanced: VaryingLocalizationTable {}
extension LocalizedStringResource.LocalizablePowerUser: VaryingLocalizationTable {}
