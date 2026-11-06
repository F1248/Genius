//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

extension SystemInformationTests {

	enum Recommendations {

		struct Performance {

			@Test
			func uptime() async {
				#expect(await SystemInformation.Recommendations.Performance.uptime.test)
			}
		}

		struct HardwareCare {

			@Test
			func batteryChargeLimit() {
				#expect(SystemInformation.Recommendations.HardwareCare.batteryChargeLimit.test)
			}
		}

		struct TheftProtection {

			@Test
			func activationLock() async {
				#expect(await SystemInformation.Recommendations.TheftProtection.activationLock.test)
			}

			@Test
			func firmwarePassword() async {
				#expect(await SystemInformation.Recommendations.TheftProtection.firmwarePassword.test)
			}
		}

		struct DataSecurity {

			@Test
			func fileVault() async {
				#expect(await SystemInformation.Recommendations.DataSecurity.fileVault.test)
			}
		}

		struct MalwareProtection {

			@Test
			func systemIntegrityProtection() async {
				#expect(await SystemInformation.Recommendations.MalwareProtection.systemIntegrityProtection.test)
			}

			@Test
			func gatekeeper() async {
				#expect(await SystemInformation.Recommendations.MalwareProtection.gatekeeper.test)
			}

			@Test
			func protectSystemWideSettings() async {
				#expect(await SystemInformation.Recommendations.MalwareProtection.protectSystemWideSettings.test)
			}

			@Test
			func firewall() async {
				#expect(await SystemInformation.Recommendations.MalwareProtection.firewall.test)
			}

			@Test
			func allowAccessoriesToConnect() {
				#expect(SystemInformation.Recommendations.MalwareProtection.allowAccessoriesToConnect.test)
			}
		}

		struct SecurityUpdates {

			@Test
			func availableUpdates() async {
				#expect(await SystemInformation.Recommendations.SecurityUpdates.availableUpdates.test)
			}
		}

		struct AutomaticUpdates {

			@Test
			func checkMacOS() {
				#expect(SystemInformation.Recommendations.AutomaticUpdates.checkMacOS.test)
			}

			@Test
			func downloadMacOS() {
				#expect(SystemInformation.Recommendations.AutomaticUpdates.downloadMacOS.test)
			}

			@Test
			func installMacOS() {
				#expect(SystemInformation.Recommendations.AutomaticUpdates.installMacOS.test)
			}

			@Test
			func installCritical() {
				#expect(SystemInformation.Recommendations.AutomaticUpdates.installCritical.test)
			}

			@Test
			func installConfigurationData() {
				#expect(SystemInformation.Recommendations.AutomaticUpdates.installConfigurationData.test)
			}

			@Test
			func backgroundSecurityImprovements() {
				#expect(SystemInformation.Recommendations.AutomaticUpdates.backgroundSecurityImprovements.test)
			}

			@Test
			func installAppStoreApps() {
				#expect(SystemInformation.Recommendations.AutomaticUpdates.installAppStoreApps.test)
			}
		}
	}
}
