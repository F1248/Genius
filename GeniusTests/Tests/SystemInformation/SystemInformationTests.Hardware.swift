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
				#expect(SystemInformation.Hardware.Model.isVirtualMachine.testCondition)
			}

			@Test
			func isLaptop() {
				#expect(SystemInformation.Hardware.Model.isLaptop.testCondition)
			}

			@Test
			func name() {
				#expect(SystemInformation.Hardware.Model.name.testCondition)
			}

			@Test
			func localizedName() async {
				#expect(await SystemInformation.Hardware.Model.localizedName.testCondition)
			}

			@Test
			func displayName() async {
				#expect(await SystemInformation.Hardware.Model.displayName.testCondition)
			}

			@Test
			func identifier() {
				#expect(SystemInformation.Hardware.Model.identifier.testCondition)
			}

			@Test
			func namePrefix() {
				#expect(SystemInformation.Hardware.Model.namePrefix.testCondition)
			}

			@Test
			func board() {
				#expect(SystemInformation.Hardware.Model.board.testCondition)
			}

			@Test
			func number() {
				#expect(SystemInformation.Hardware.Model.number.testCondition)
			}

			@Test
			func regulatoryNumber() {
				#expect(SystemInformation.Hardware.Model.regulatoryNumber.testCondition)
			}

			@Test
			func symbol() {
				#expect(SystemInformation.Hardware.Model.symbol != .desktopcomputerAndMacbook)
			}
		}

		@Test
		func securityChip() {
			#expect(SystemInformation.Hardware.securityChip.testCondition)
		}

		struct CPU {

			struct Cores {

				@Test
				func differentTypes() {
					#expect(SystemInformation.Hardware.CPU.Cores.differentTypes.testCondition)
				}

				@Test
				func total() {
					#expect(SystemInformation.Hardware.CPU.Cores.total.testCondition)
				}

				@Test
				func performance() {
					#expect(SystemInformation.Hardware.CPU.Cores.performance.testCondition)
				}

				@Test
				func efficiency() {
					#expect(SystemInformation.Hardware.CPU.Cores.efficiency.testCondition)
				}
			}

			@Test
			func type() {
				#expect(SystemInformation.Hardware.CPU.type.testCondition)
			}

			@Test
			func name() {
				#expect(SystemInformation.Hardware.CPU.name.testCondition)
			}

			@Test
			func identifier() {
				#expect(SystemInformation.Hardware.CPU.identifier.testCondition)
			}

			@Test
			func frequency() {
				#expect(SystemInformation.Hardware.CPU.frequency.testCondition)
			}
		}

		@Test
		func memory() {
			#expect(SystemInformation.Hardware.memory.testCondition)
		}

		struct Machine {

			@Test
			func serialNumber() {
				#expect(SystemInformation.Hardware.Machine.serialNumber.testCondition)
			}

			@Test
			func hardwareUUID() {
				#expect(SystemInformation.Hardware.Machine.hardwareUUID.testCondition)
			}

			@Test
			func provisioningUDID() async {
				#expect(await SystemInformation.Hardware.Machine.provisioningUDID.testCondition)
			}
		}
	}
	// swiftformat:enable organizeDeclarations
	// swiftlint:enable type_contents_order
}
