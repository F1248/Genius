//
// MaintenanceView.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

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
					): SystemInformation.MaintenanceChecks.TheftProtection.activationLock,
					MaintenanceCheckLabel(
						"Firmware Password",
					): SystemInformation.MaintenanceChecks.TheftProtection.firmwarePassword,
				],
				"Data Security": [
					MaintenanceCheckLabel(
						"FileVault",
					): SystemInformation.MaintenanceChecks.DataSecurity.fileVault,
				],
				"Malware Protection": [
					MaintenanceCheckLabel(
						"System Integrity Protection",
					): SystemInformation.MaintenanceChecks.MalwareProtection.systemIntegrityProtection,
					MaintenanceCheckLabel(
						"Firewall",
					): SystemInformation.MaintenanceChecks.MalwareProtection.firewall,
					MaintenanceCheckLabel(
						"Gatekeeper",
					): SystemInformation.MaintenanceChecks.MalwareProtection.gatekeeper,
				],
				"Automatic Updates": [
					MaintenanceCheckLabel(
						"Check for macOS updates",
					): SystemInformation.MaintenanceChecks.AutomaticUpdates.checkMacOS,
					MaintenanceCheckLabel(
						"Download macOS updates",
					): SystemInformation.MaintenanceChecks.AutomaticUpdates.downloadMacOS,
					MaintenanceCheckLabel(
						"Install macOS updates",
					): SystemInformation.MaintenanceChecks.AutomaticUpdates.installMacOS,
					MaintenanceCheckLabel(
						"Install critical updates",
					): SystemInformation.MaintenanceChecks.AutomaticUpdates.installCritical,
					MaintenanceCheckLabel(
						"Install configuration data updates",
					): SystemInformation.MaintenanceChecks.AutomaticUpdates.installConfigurationData,
					MaintenanceCheckLabel(
						"Install app updates from the App Store",
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
