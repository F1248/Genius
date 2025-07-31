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
			func name() async {
				#expect(await SystemInformation.Hardware.Model.name.testCondition)
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
			func identifier() async {
				#expect(await SystemInformation.Hardware.Model.identifier.testCondition)
			}

			@Test
			func namePrefix() {
				#expect(SystemInformation.Hardware.Model.namePrefix.testCondition)
			}

			@Test
			func number() async {
				#expect(await SystemInformation.Hardware.Model.number.testCondition)
			}

			@Test
			func regulatoryNumber() async {
				#expect(await SystemInformation.Hardware.Model.regulatoryNumber.testCondition)
			}

			@Test
			func symbol() {
				#expect(SystemInformation.Hardware.Model.symbol != .desktopcomputerAndMacbook)
			}
		}

		@Test
		func securityChip() async {
			#expect(await SystemInformation.Hardware.securityChip.testCondition)
		}

		struct CPU {

			struct Cores {

				@Test
				func differentTypes() {
					#expect(SystemInformation.Hardware.CPU.Cores.differentTypes.testCondition)
				}

				@Test
				func total() async {
					#expect(await SystemInformation.Hardware.CPU.Cores.total.testCondition)
				}

				@Test
				func performance() async {
					#expect(await SystemInformation.Hardware.CPU.Cores.performance.testCondition)
				}

				@Test
				func efficiency() async {
					#expect(await SystemInformation.Hardware.CPU.Cores.efficiency.testCondition)
				}
			}

			@Test
			func type() async {
				#expect(await SystemInformation.Hardware.CPU.type.testCondition)
			}

			@Test
			func name() async {
				#expect(await SystemInformation.Hardware.CPU.name.testCondition)
			}

			@Test
			func frequency() async {
				#expect(await SystemInformation.Hardware.CPU.frequency.testCondition)
			}
		}

		@Test
		func memory() async {
			#expect(await SystemInformation.Hardware.memory.testCondition)
		}

		struct Machine {

			@Test
			func serialNumber() async {
				#expect(await SystemInformation.Hardware.Machine.serialNumber.testCondition)
			}

			@Test
			func hardwareUUID() async {
				#expect(await SystemInformation.Hardware.Machine.hardwareUUID.testCondition)
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
