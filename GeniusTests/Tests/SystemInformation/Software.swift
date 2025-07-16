//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

extension SystemInformationTests {

	@Suite("Software")
	enum Software {

		@Suite("SMC")
		struct SMC {

			@Test("version")
			func version() async {
				#expect(await SystemInformation.Software.SMC.version.testCondition)
			}
		}

		@Suite("Firmware")
		struct Firmware {

			@Test("version")
			func version() async {
				#expect(await SystemInformation.Software.Firmware.version.testCondition)
			}
		}

		@Suite("Kernel")
		struct Kernel {

			@Test("name")
			func name() async {
				#expect(await SystemInformation.Software.Kernel.name.testCondition)
			}

			@Test("version")
			func version() async {
				#expect(await SystemInformation.Software.Kernel.version.testCondition)
			}
		}

		@Suite("OS")
		struct OS {

			@Test("version")
			func version() async {
				#expect(await SystemInformation.Software.OS.version.testCondition)
			}

			@Test("codeName")
			func codeName() async {
				#expect(await SystemInformation.Software.OS.codeName.testCondition)
			}

			@Test("buildNumber")
			func buildNumber() async {
				#expect(await SystemInformation.Software.OS.buildNumber.testCondition)
			}

			@Test("bootMode")
			func bootMode() async {
				#expect(await SystemInformation.Software.OS.bootMode.testCondition)
			}

			@Test("bootVolume")
			func bootVolume() async {
				#expect(await SystemInformation.Software.OS.bootVolume.testCondition)
			}

			@Test("loaderVersion")
			func loaderVersion() async {
				#expect(await SystemInformation.Software.OS.loaderVersion.testCondition)
			}
		}

		@Suite("Computer")
		struct Computer {

			@Test("name")
			func name() async {
				#expect(await SystemInformation.Software.Computer.name.testCondition)
			}

			@Test("hostName")
			func hostName() async {
				#expect(await SystemInformation.Software.Computer.hostName.testCondition)
			}
		}

		@Suite("User")
		struct User {

			@Test("name")
			func name() async {
				#expect(await SystemInformation.Software.User.name.testCondition)
			}

			@Test("accountName")
			func accountName() async {
				#expect(await SystemInformation.Software.User.accountName.testCondition)
			}
		}
	}
}
