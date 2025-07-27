//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import Foundation

protocol VaryingLocalizationTable {

	static var administratorPrivilegesRequest: LocalizedStringResource { get }
	static var askToAllowAccessoriesToConnect: LocalizedStringResource { get }
	static var automaticUpdates: LocalizedStringResource { get }
	static var bootMode: LocalizedStringResource { get }
	static var bootVolume: LocalizedStringResource { get }
	static var checkForMacOSUpdates: LocalizedStringResource { get }
	static var cpuFrequency: LocalizedStringResource { get }
	static var cpuName: LocalizedStringResource { get }
	static var cpuType: LocalizedStringResource { get }
	static var downloadMacOSUpdates: LocalizedStringResource { get }
	static var installAppStoreAppUpdates: LocalizedStringResource { get }
	static var installConfigurationDataUpdates: LocalizedStringResource { get }
	static var installCriticalUpdates: LocalizedStringResource { get }
	static var installMacOSUpdates: LocalizedStringResource { get }
	static var malwareProtection: LocalizedStringResource { get }
	static var systemInformation: LocalizedStringResource { get }
	static var uninstallApp: LocalizedStringResource { get }
	static var uninstallAppEllipsis: LocalizedStringResource { get }
	static var uninstallationMessage: LocalizedStringResource { get }
	static var uninstallationTitle: LocalizedStringResource { get }
}

extension LocalizedStringResource: VaryingLocalizationTable {

	static var localizationTable: any VaryingLocalizationTable.Type { Defaults[.interfaceMode].localizationTable }

	static var administratorPrivilegesRequest: Self { localizationTable.administratorPrivilegesRequest }
	static var askToAllowAccessoriesToConnect: Self { localizationTable.askToAllowAccessoriesToConnect }
	static var automaticUpdates: Self { localizationTable.automaticUpdates }
	static var bootMode: Self { localizationTable.bootMode }
	static var bootVolume: Self { localizationTable.bootVolume }
	static var checkForMacOSUpdates: Self { localizationTable.checkForMacOSUpdates }
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
}

extension LocalizedStringResource.LocalizableSimple: VaryingLocalizationTable {}
extension LocalizedStringResource.LocalizableNormal: VaryingLocalizationTable {}
extension LocalizedStringResource.LocalizableAdvanced: VaryingLocalizationTable {}
extension LocalizedStringResource.LocalizablePowerUser: VaryingLocalizationTable {}
