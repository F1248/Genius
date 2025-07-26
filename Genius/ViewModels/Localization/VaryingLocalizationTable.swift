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

	static var administratorPrivilegesRequest: LocalizedStringResource { localizationTable.administratorPrivilegesRequest }
	static var askToAllowAccessoriesToConnect: LocalizedStringResource { localizationTable.askToAllowAccessoriesToConnect }
	static var automaticUpdates: LocalizedStringResource { localizationTable.automaticUpdates }
	static var bootMode: LocalizedStringResource { localizationTable.bootMode }
	static var bootVolume: LocalizedStringResource { localizationTable.bootVolume }
	static var checkForMacOSUpdates: LocalizedStringResource { localizationTable.checkForMacOSUpdates }
	static var cpuFrequency: LocalizedStringResource { localizationTable.cpuFrequency }
	static var cpuName: LocalizedStringResource { localizationTable.cpuName }
	static var cpuType: LocalizedStringResource { localizationTable.cpuType }
	static var downloadMacOSUpdates: LocalizedStringResource { localizationTable.downloadMacOSUpdates }
	static var installAppStoreAppUpdates: LocalizedStringResource { localizationTable.installAppStoreAppUpdates }
	static var installConfigurationDataUpdates: LocalizedStringResource { localizationTable.installConfigurationDataUpdates }
	static var installCriticalUpdates: LocalizedStringResource { localizationTable.installCriticalUpdates }
	static var installMacOSUpdates: LocalizedStringResource { localizationTable.installMacOSUpdates }
	static var malwareProtection: LocalizedStringResource { localizationTable.malwareProtection }
	static var systemInformation: LocalizedStringResource { localizationTable.systemInformation }
	static var uninstallApp: LocalizedStringResource { localizationTable.uninstallApp }
	static var uninstallAppEllipsis: LocalizedStringResource { localizationTable.uninstallAppEllipsis }
	static var uninstallationMessage: LocalizedStringResource { localizationTable.uninstallationMessage }
	static var uninstallationTitle: LocalizedStringResource { localizationTable.uninstallationTitle }
}

extension LocalizedStringResource.LocalizableSimple: VaryingLocalizationTable {}
extension LocalizedStringResource.LocalizableNormal: VaryingLocalizationTable {}
extension LocalizedStringResource.LocalizableAdvanced: VaryingLocalizationTable {}
extension LocalizedStringResource.LocalizablePowerUser: VaryingLocalizationTable {}
