//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

extension SystemInformationTests {

	enum MaintenanceChecks {

		struct TheftProtection {

			@Test
			func activationLock() async {
				#expect(await SystemInformation.MaintenanceChecks.TheftProtection.activationLock.testCondition)
			}

			@Test
			func firmwarePassword() async {
				#expect(await SystemInformation.MaintenanceChecks.TheftProtection.firmwarePassword.testCondition)
			}
		}

		struct DataSecurity {

			@Test
			func fileVault() async {
				#expect(await SystemInformation.MaintenanceChecks.DataSecurity.fileVault.testCondition)
			}
		}

		struct MalwareProtection {

			@Test
			func systemIntegrityProtection() async {
				#expect(await SystemInformation.MaintenanceChecks.MalwareProtection.systemIntegrityProtection.testCondition)
			}

			@Test
			func firewall() async {
				#expect(await SystemInformation.MaintenanceChecks.MalwareProtection.firewall.testCondition)
			}

			@Test
			func gatekeeper() async {
				#expect(await SystemInformation.MaintenanceChecks.MalwareProtection.gatekeeper.testCondition)
			}

			@Test
			func askToAllowAccessoriesToConnect() async {
				#expect(await SystemInformation.MaintenanceChecks.MalwareProtection.allowAccessoriesToConnect.testCondition)
			}
		}

		struct AutomaticUpdates {

			@Test
			func downloadMacOS() async {
				#expect(await SystemInformation.MaintenanceChecks.AutomaticUpdates.downloadMacOS.testCondition)
			}

			@Test
			func installMacOS() async {
				#expect(await SystemInformation.MaintenanceChecks.AutomaticUpdates.installMacOS.testCondition)
			}

			@Test
			func installCritical() async {
				#expect(await SystemInformation.MaintenanceChecks.AutomaticUpdates.installCritical.testCondition)
			}

			@Test
			func installConfigurationData() async {
				#expect(await SystemInformation.MaintenanceChecks.AutomaticUpdates.installConfigurationData.testCondition)
			}

			@Test
			func installAppStoreApps() async {
				#expect(await SystemInformation.MaintenanceChecks.AutomaticUpdates.installAppStoreApps.testCondition)
			}
		}
	}
}
