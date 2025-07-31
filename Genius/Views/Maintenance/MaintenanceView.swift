//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import SwiftUI

struct MaintenanceView: View {

	var body: some View {
		MaintenanceDataView(content: [
			.theftProtection: [
				MaintenanceCheckLabel(
					.activationLock,
					help: URL(appleSupportArticle: 102_541),
					setting: URL(systemSetting: .iCloud),
				): SystemInformation.MaintenanceChecks.TheftProtection.activationLock,
				MaintenanceCheckLabel(
					.firmwarePassword,
					help: URL(appleSupportArticle: 102_384),
				): SystemInformation.MaintenanceChecks.TheftProtection.firmwarePassword,
			],
			.dataSecurity: [
				MaintenanceCheckLabel(
					.fileVault,
					help: URL(appleUserGuideArticle: "mh11785"),
					setting: URL(systemSetting: .fileVault),
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
					setting: URL(systemSetting: .firewall),
				): SystemInformation.MaintenanceChecks.MalwareProtection.firewall,
				MaintenanceCheckLabel(
					.gatekeeper,
					help: URL(appleSupportArticle: 102_445),
					setting: URL(systemSetting: .security),
				): SystemInformation.MaintenanceChecks.MalwareProtection.gatekeeper,
				MaintenanceCheckLabel(
					.askToAllowAccessoriesToConnect,
					help: URL(appleSupportArticle: 102_282),
					setting: URL(systemSetting: .accessories),
				): SystemInformation.MaintenanceChecks.MalwareProtection.allowAccessoriesToConnect,
			],
			.automaticUpdates: [
				MaintenanceCheckLabel(
					.downloadMacOSUpdates,
					help: URL(appleSupportArticle: 108_382),
					setting: URL(systemSetting: .softwareUpdate),
				): SystemInformation.MaintenanceChecks.AutomaticUpdates.downloadMacOS,
				MaintenanceCheckLabel(
					.installMacOSUpdates,
					help: URL(appleSupportArticle: 108_382),
					setting: URL(systemSetting: .softwareUpdate),
				): SystemInformation.MaintenanceChecks.AutomaticUpdates.installMacOS,
				MaintenanceCheckLabel(
					.installCriticalUpdates,
					help: URL(appleSupportArticle: 101_591),
					setting: URL(systemSetting: .softwareUpdate),
				): SystemInformation.MaintenanceChecks.AutomaticUpdates.installCritical,
				MaintenanceCheckLabel(
					.installConfigurationDataUpdates,
					help: URL(appleSupportArticle: 101_591),
					setting: URL(systemSetting: .softwareUpdate),
				): SystemInformation.MaintenanceChecks.AutomaticUpdates.installConfigurationData,
				MaintenanceCheckLabel(
					.installAppStoreAppUpdates,
					help: URL(appleSupportArticle: 102_629),
					setting: {
						if #available(macOS 26, *) {
							URL(string: "macappstore:showSettingsPage")
						} else {
							URL(systemSetting: .softwareUpdate)
						}
					}(),
				): SystemInformation.MaintenanceChecks.AutomaticUpdates.installAppStoreApps,
			],
		])
	}
}

#Preview {
	MaintenanceView()
		.frame(width: 686, height: 256)
}
