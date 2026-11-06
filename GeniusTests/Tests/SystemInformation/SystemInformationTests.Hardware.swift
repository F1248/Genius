//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import SFSafeSymbols
import Testing

extension SystemInformationTests {

	// swiftformat:disable organizeDeclarations
	// swiftlint:disable type_contents_order
	struct Hardware {

		struct Model {

			@Test
			func isVirtualMachine() {
				#expect(SystemInformation.Hardware.Model.isVirtualMachine.test)
			}

			@Test
			func isLaptop() {
				#expect(SystemInformation.Hardware.Model.isLaptop.test)
			}

			@Test
			func name() {
				#expect(SystemInformation.Hardware.Model.name.test)
			}

			@Test
			func localizedName() async {
				#expect(await SystemInformation.Hardware.Model.localizedName.test)
			}

			@Test
			func displayName() async {
				#expect(await SystemInformation.Hardware.Model.displayName.test)
			}

			@Test
			func identifier() {
				#expect(SystemInformation.Hardware.Model.identifier.test)
			}

			@Test
			func board() {
				#expect(SystemInformation.Hardware.Model.board.test)
			}

			@Test
			func number() {
				#expect(SystemInformation.Hardware.Model.number.test)
			}

			@Test
			func configCode() {
				#expect(SystemInformation.Hardware.Model.configCode.test)
			}

			@Test
			func regulatoryNumber() {
				#expect(SystemInformation.Hardware.Model.regulatoryNumber.test)
			}

			@Test
			func symbol() {
				#expect(SystemInformation.Hardware.Model.symbol != .desktopcomputerAndMacbook)
			}
		}

		@Test
		func securityChip() {
			#expect(SystemInformation.Hardware.securityChip.test)
		}

		struct CPU {

			struct Cores {

				@Test
				func differentTypes() {
					#expect(SystemInformation.Hardware.CPU.Cores.differentTypes.test)
				}

				@Test
				func total() {
					#expect(SystemInformation.Hardware.CPU.Cores.total.test)
				}

				@Test
				func performance() {
					#expect(SystemInformation.Hardware.CPU.Cores.performance.test)
				}

				@Test
				func efficiency() {
					#expect(SystemInformation.Hardware.CPU.Cores.efficiency.test)
				}
			}

			@Test
			func type() {
				#expect(SystemInformation.Hardware.CPU.type.test)
			}

			@Test
			func name() {
				#expect(SystemInformation.Hardware.CPU.name.test)
			}

			@Test
			func identifier() {
				#expect(SystemInformation.Hardware.CPU.identifier.test)
			}

			@Test
			func frequency() {
				#expect(SystemInformation.Hardware.CPU.frequency.test)
			}
		}

		@Test
		func memory() {
			#expect(SystemInformation.Hardware.memory.test)
		}

		struct Machine {

			@Test
			func serialNumber() {
				#expect(SystemInformation.Hardware.Machine.serialNumber.test)
			}

			@Test
			func hardwareUUID() {
				#expect(SystemInformation.Hardware.Machine.hardwareUUID.test)
			}

			@Test
			func provisioningUDID() async {
				#expect(await SystemInformation.Hardware.Machine.provisioningUDID.test)
			}
		}
	}
	// swiftformat:enable organizeDeclarations
	// swiftlint:enable type_contents_order
}
