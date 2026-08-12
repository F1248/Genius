//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

extension SystemInformationTests {

	enum Recommendations {

		struct TheftProtection {

			@Test
			func activationLock() async {
				#expect(await SystemInformation.Recommendations.TheftProtection.activationLock.testCondition)
			}

			@Test
			func firmwarePassword() async {
				#expect(await SystemInformation.Recommendations.TheftProtection.firmwarePassword.testCondition)
			}
		}

		struct DataSecurity {

			@Test
			func fileVault() async {
				#expect(await SystemInformation.Recommendations.DataSecurity.fileVault.testCondition)
			}
		}

		struct MalwareProtection {

			@Test
			func systemIntegrityProtection() async {
				#expect(await SystemInformation.Recommendations.MalwareProtection.systemIntegrityProtection.testCondition)
			}

			@Test
			func firewall() async {
				#expect(await SystemInformation.Recommendations.MalwareProtection.firewall.testCondition)
			}

			@Test
			func gatekeeper() async {
				#expect(await SystemInformation.Recommendations.MalwareProtection.gatekeeper.testCondition)
			}

			@Test
			func askToAllowAccessoriesToConnect() {
				#expect(SystemInformation.Recommendations.MalwareProtection.allowAccessoriesToConnect.testCondition)
			}
		}

		struct AutomaticUpdates {

			@Test
			func checkMacOS() {
				#expect(SystemInformation.Recommendations.AutomaticUpdates.checkMacOS.testCondition)
			}

			@Test
			func downloadMacOS() {
				#expect(SystemInformation.Recommendations.AutomaticUpdates.downloadMacOS.testCondition)
			}

			@Test
			func installMacOS() {
				#expect(SystemInformation.Recommendations.AutomaticUpdates.installMacOS.testCondition)
			}

			@Test
			func installCritical() {
				#expect(SystemInformation.Recommendations.AutomaticUpdates.installCritical.testCondition)
			}

			@Test
			func installConfigurationData() {
				#expect(SystemInformation.Recommendations.AutomaticUpdates.installConfigurationData.testCondition)
			}

			@Test
			func installAppStoreApps() {
				#expect(SystemInformation.Recommendations.AutomaticUpdates.installAppStoreApps.testCondition)
			}
		}
	}
}
