//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

extension SystemInformationTests {

	@Suite("MaintenanceChecks")
	enum MaintenanceChecks {

		@Suite("TheftProtection")
		struct TheftProtection {

			@Test("activationLock")
			func activationLock() async {
				#expect(await SystemInformation.MaintenanceChecks.TheftProtection.activationLock.testCondition)
			}

			@Test("firmwarePassword")
			func firmwarePassword() async {
				#expect(await SystemInformation.MaintenanceChecks.TheftProtection.firmwarePassword.testCondition)
			}
		}

		@Suite("DataSecurity")
		struct DataSecurity {

			@Test("fileVault")
			func fileVault() async {
				#expect(await SystemInformation.MaintenanceChecks.DataSecurity.fileVault.testCondition)
			}
		}

		@Suite("MalwareProtection")
		struct MalwareProtection {

			@Test("systemIntegrityProtection")
			func systemIntegrityProtection() async {
				#expect(await SystemInformation.MaintenanceChecks.MalwareProtection.systemIntegrityProtection.testCondition)
			}

			@Test("firewall")
			func firewall() async {
				#expect(await SystemInformation.MaintenanceChecks.MalwareProtection.firewall.testCondition)
			}

			@Test("gatekeeper")
			func gatekeeper() async {
				#expect(await SystemInformation.MaintenanceChecks.MalwareProtection.gatekeeper.testCondition)
			}

			@Test("askToAllowAccessoriesToConnect")
			func askToAllowAccessoriesToConnect() async {
				#expect(
					await SystemInformation.MaintenanceChecks.MalwareProtection.askToAllowAccessoriesToConnect.testCondition,
				)
			}
		}

		@Suite("AutomaticUpdates")
		struct AutomaticUpdates {

			@Test("checkMacOS")
			func checkMacOS() async {
				#expect(await SystemInformation.MaintenanceChecks.AutomaticUpdates.checkMacOS.testCondition)
			}

			@Test("downloadMacOS")
			func downloadMacOS() async {
				#expect(await SystemInformation.MaintenanceChecks.AutomaticUpdates.downloadMacOS.testCondition)
			}

			@Test("installMacOS")
			func installMacOS() async {
				#expect(await SystemInformation.MaintenanceChecks.AutomaticUpdates.installMacOS.testCondition)
			}

			@Test("installCritical")
			func installCritical() async {
				#expect(await SystemInformation.MaintenanceChecks.AutomaticUpdates.installCritical.testCondition)
			}

			@Test("installConfigurationData")
			func installConfigurationData() async {
				#expect(await SystemInformation.MaintenanceChecks.AutomaticUpdates.installConfigurationData.testCondition)
			}

			@Test("installAppStoreApps")
			func installAppStoreApps() async {
				#expect(await SystemInformation.MaintenanceChecks.AutomaticUpdates.installAppStoreApps.testCondition)
			}
		}
	}
}
