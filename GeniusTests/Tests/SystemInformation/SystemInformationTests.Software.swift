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
				#expect(await SystemInformation.Software.SMC.version.test)
			}
		}

		struct Firmware {

			@Test
			func version() async {
				#expect(await SystemInformation.Software.Firmware.version.test)
			}
		}

		struct Kernel {

			@Test
			func name() {
				#expect(SystemInformation.Software.Kernel.name.test)
			}

			@Test
			func version() {
				#expect(SystemInformation.Software.Kernel.version.test)
			}
		}

		struct OS {

			@Test
			func version() {
				#expect(SystemInformation.Software.OS.version.test)
			}

			@Test
			func codeName() {
				#expect(SystemInformation.Software.OS.codeName.test)
			}

			@Test
			func buildNumber() {
				#expect(SystemInformation.Software.OS.buildNumber.test)
			}

			@Test
			func bootMode() {
				#expect(SystemInformation.Software.OS.bootMode.test)
			}

			@Test
			func bootVolume() async {
				#expect(await SystemInformation.Software.OS.bootVolume.test)
			}

			@Test
			func loaderVersion() async {
				#expect(await SystemInformation.Software.OS.loaderVersion.test)
			}
		}

		struct Computer {

			@Test
			func name() {
				#expect(SystemInformation.Software.Computer.name.test)
			}

			@Test
			func hostName() {
				#expect(SystemInformation.Software.Computer.hostName.test)
			}
		}

		struct User {

			@Test
			func name() {
				#expect(SystemInformation.Software.User.name.test)
			}

			@Test
			func accountName() {
				#expect(SystemInformation.Software.User.accountName.test)
			}
		}
	}
}
