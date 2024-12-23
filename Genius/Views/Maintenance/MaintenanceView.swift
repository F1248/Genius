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
		Text("Maintenance")
			.font(.largeTitle)
			.padding()
		MaintenanceDataView(content: [
			"Theft Protection": [
				"Activation Lock": SystemInformation.MaintenanceChecks.TheftProtection.activationLock,
				"Firmware Password": SystemInformation.MaintenanceChecks.TheftProtection.firmwarePassword,
			],
			"Data Security": [
				"FileVault": SystemInformation.MaintenanceChecks.DataSecurity.fileVault,
			],
			"Malware Protection": [
				"System Integrity Protection": SystemInformation.MaintenanceChecks.MalwareProtection.systemIntegrityProtection,
				"Firewall": SystemInformation.MaintenanceChecks.MalwareProtection.firewall,
				"Gatekeeper": SystemInformation.MaintenanceChecks.MalwareProtection.gatekeeper,
			],
			"Automatic Updates": [
				"Download macOS updates": SystemInformation.MaintenanceChecks.AutomaticUpdates.downloadMacOS,
				"Install macOS updates": SystemInformation.MaintenanceChecks.AutomaticUpdates.installMacOS,
				"Install critical updates": SystemInformation.MaintenanceChecks.AutomaticUpdates.installCritical,
				"Install configuration data updates": SystemInformation.MaintenanceChecks.AutomaticUpdates.installConfigurationData,
				"Install app updates from the App Store": SystemInformation.MaintenanceChecks.AutomaticUpdates.installAppStoreApps,
			],
		])
	}
}

#Preview {
	MaintenanceView()
}
