//
// MaintenanceView.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import SwiftUI
import SwiftUICore

struct MaintenanceView: View {

	var body: some View {
		VStack {
			Text("Maintenance")
				.font(.largeTitle)
				.padding()
			MaintenanceDataView(content: [
				"Theft Protection": [
					MaintenanceCheckLabel(
						"Activation Lock",
						help: URL(appleSupportArticle: 102_541),
						systemSetting: URL(systemSetting: .iCloud),
					): SystemInformation.MaintenanceChecks.TheftProtection.activationLock,
					MaintenanceCheckLabel(
						"Firmware Password",
						help: URL(appleSupportArticle: 102_384),
					): SystemInformation.MaintenanceChecks.TheftProtection.firmwarePassword,
				],
				"Data Security": [
					MaintenanceCheckLabel(
						"FileVault",
						help: URL(appleUserGuideArticle: "mh11785"),
						systemSetting: URL(systemSetting: .fileVault),
					): SystemInformation.MaintenanceChecks.DataSecurity.fileVault,
				],
				"Malware Protection": [
					MaintenanceCheckLabel(
						"System Integrity Protection",
						help: URL(appleSupportArticle: 102_149),
					): SystemInformation.MaintenanceChecks.MalwareProtection.systemIntegrityProtection,
					MaintenanceCheckLabel(
						"Firewall",
						help: URL(appleUserGuideArticle: "mh34041"),
						systemSetting: URL(systemSetting: .firewall),
					): SystemInformation.MaintenanceChecks.MalwareProtection.firewall,
					MaintenanceCheckLabel(
						"Gatekeeper",
						help: URL(appleSupportArticle: 102_445),
						systemSetting: URL(systemSetting: .security),
					): SystemInformation.MaintenanceChecks.MalwareProtection.gatekeeper,
					MaintenanceCheckLabel(
						"Ask to allow accessories to connect",
						help: URL(appleSupportArticle: 102_282),
						systemSetting: URL(systemSetting: .accessories),
					): SystemInformation.MaintenanceChecks.MalwareProtection.askToAllowAccessoriesToConnect,
				],
				"Automatic Updates": [
					MaintenanceCheckLabel(
						"Download macOS updates",
						help: URL(appleSupportArticle: 108_382),
						systemSetting: URL(systemSetting: .softwareUpdate),
					): SystemInformation.MaintenanceChecks.AutomaticUpdates.downloadMacOS,
					MaintenanceCheckLabel(
						"Install macOS updates",
						help: URL(appleSupportArticle: 108_382),
						systemSetting: URL(systemSetting: .softwareUpdate),
					): SystemInformation.MaintenanceChecks.AutomaticUpdates.installMacOS,
					MaintenanceCheckLabel(
						"Install critical updates",
						help: URL(appleSupportArticle: 101_591),
						systemSetting: URL(systemSetting: .softwareUpdate),
					): SystemInformation.MaintenanceChecks.AutomaticUpdates.installCritical,
					MaintenanceCheckLabel(
						"Install configuration data updates",
						help: URL(appleSupportArticle: 101_591),
						systemSetting: URL(systemSetting: .softwareUpdate),
					): SystemInformation.MaintenanceChecks.AutomaticUpdates.installConfigurationData,
					MaintenanceCheckLabel(
						"Install app updates from the App Store",
						help: URL(appleSupportArticle: 102_629),
						systemSetting: URL(systemSetting: .softwareUpdate),
					): SystemInformation.MaintenanceChecks.AutomaticUpdates.installAppStoreApps,
				],
			])
		}
	}
}

#Preview {
	MaintenanceView()
		.frame(width: 686, height: 256)
}
