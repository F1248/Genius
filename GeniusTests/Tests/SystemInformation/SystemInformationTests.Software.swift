//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

extension SystemInformationTests {

	enum Software {

		struct SMC {

			@Test
			func version() async {
				#expect(await SystemInformation.Software.SMC.version.testCondition)
			}
		}

		struct Firmware {

			@Test
			func version() async {
				#expect(await SystemInformation.Software.Firmware.version.testCondition)
			}
		}

		struct Kernel {

			@Test
			func name() {
				#expect(SystemInformation.Software.Kernel.name.testCondition)
			}

			@Test
			func version() {
				#expect(SystemInformation.Software.Kernel.version.testCondition)
			}
		}

		struct OS {

			@Test
			func version() {
				#expect(SystemInformation.Software.OS.version.testCondition)
			}

			@Test
			func codeName() {
				#expect(SystemInformation.Software.OS.codeName.testCondition)
			}

			@Test
			func buildNumber() {
				#expect(SystemInformation.Software.OS.buildNumber.testCondition)
			}

			@Test
			func bootMode() {
				#expect(SystemInformation.Software.OS.bootMode.testCondition)
			}

			@Test
			func bootVolume() async {
				#expect(await SystemInformation.Software.OS.bootVolume.testCondition)
			}

			@Test
			func loaderVersion() async {
				#expect(await SystemInformation.Software.OS.loaderVersion.testCondition)
			}
		}

		struct Computer {

			@Test
			func name() async {
				#expect(await SystemInformation.Software.Computer.name.testCondition)
			}

			@Test
			func hostName() {
				#expect(SystemInformation.Software.Computer.hostName.testCondition)
			}
		}

		struct User {

			@Test
			func name() {
				#expect(SystemInformation.Software.User.name.testCondition)
			}

			@Test
			func accountName() {
				#expect(SystemInformation.Software.User.accountName.testCondition)
			}
		}
	}
}
