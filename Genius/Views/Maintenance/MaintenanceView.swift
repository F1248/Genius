//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import SwiftUI

struct MaintenanceView: View {

	var body: some View {
		FormView(content: [
			.theftProtection: [
				MaintenanceCheckLabel(
					.activationLock,
					help: URL(appleSupportArticle: 102_541),
					setting: SystemSetting.iCloud,
				): SystemInformation.MaintenanceChecks.TheftProtection.activationLock,
				MaintenanceCheckLabel(
					.firmwarePassword,
					help: URL(appleSupportArticle: 102_384),
					setting: Application.startupSecurityUtility,
				): SystemInformation.MaintenanceChecks.TheftProtection.firmwarePassword,
			],
			.dataSecurity: [
				MaintenanceCheckLabel(
					.fileVault,
					help: URL(appleUserGuideArticle: "mh11785"),
					setting: SystemSetting.fileVault,
				): SystemInformation.MaintenanceChecks.DataSecurity.fileVault,
			],
			.malwareProtection: [
				MaintenanceCheckLabel(
					.systemIntegrityProtection,
					help: URL(appleSupportArticle: 102_149),
				): SystemInformation.MaintenanceChecks.MalwareProtection.systemIntegrityProtection,
				MaintenanceCheckLabel(
					.firewall,
					help: URL(appleUserGuideArticle: "mh34041"),
					setting: SystemSetting.firewall,
				): SystemInformation.MaintenanceChecks.MalwareProtection.firewall,
				MaintenanceCheckLabel(
					.gatekeeper,
					help: URL(appleSupportArticle: 102_445),
					setting: SystemSetting.security,
				): SystemInformation.MaintenanceChecks.MalwareProtection.gatekeeper,
				MaintenanceCheckLabel(
					.askToAllowAccessoriesToConnect,
					help: URL(appleSupportArticle: 102_282),
					setting: SystemSetting.accessories ?? Application.startupSecurityUtility,
				): SystemInformation.MaintenanceChecks.MalwareProtection.allowAccessoriesToConnect,
			],
			.automaticUpdates: [
				MaintenanceCheckLabel(
					.checkForMacOSUpdates,
					help: URL(appleSupportArticle: 108_382),
					setting: SystemSetting.softwareUpdate,
				): SystemInformation.MaintenanceChecks.AutomaticUpdates.checkMacOS,
				MaintenanceCheckLabel(
					.downloadMacOSUpdates,
					help: URL(appleSupportArticle: 108_382),
					setting: SystemSetting.softwareUpdate,
				): SystemInformation.MaintenanceChecks.AutomaticUpdates.downloadMacOS,
				MaintenanceCheckLabel(
					.installMacOSUpdates,
					help: URL(appleSupportArticle: 108_382),
					setting: SystemSetting.softwareUpdate,
				): SystemInformation.MaintenanceChecks.AutomaticUpdates.installMacOS,
				MaintenanceCheckLabel(
					.installCriticalUpdates,
					help: URL(appleSupportArticle: 101_591),
					setting: SystemSetting.softwareUpdate,
				): SystemInformation.MaintenanceChecks.AutomaticUpdates.installCritical,
				MaintenanceCheckLabel(
					.installConfigurationDataUpdates,
					help: URL(appleSupportArticle: 101_591),
					setting: SystemSetting.softwareUpdate,
				): SystemInformation.MaintenanceChecks.AutomaticUpdates.installConfigurationData,
				MaintenanceCheckLabel(
					.backgroundSecurityImprovements,
					help: URL(appleSupportArticle: 102_657),
					setting: SystemSetting.backgroundSecurityImprovements,
				): SystemInformation.MaintenanceChecks.AutomaticUpdates.backgroundSecurityImprovements,
				MaintenanceCheckLabel(
					.installAppStoreAppUpdates,
					help: URL(appleSupportArticle: 102_629),
					setting: {
						if #available(macOS 26, *) {
							URL(
								string: "macappstore:showSettingsPage",
								available: SystemInformation.Software.OS.bootMode.value !=? .recovery,
							)
						} else {
							SystemSetting.softwareUpdate
						}
					}(),
				): SystemInformation.MaintenanceChecks.AutomaticUpdates.installAppStoreApps,
			],
		])
	}
}

#Preview {
	MaintenanceView()
		.frame(width: 712, height: 256)
}
