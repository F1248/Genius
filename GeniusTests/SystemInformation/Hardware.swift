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
	@Suite("Hardware")
	struct Hardware {

		@Suite("Model")
		struct Model {

			@Test("isVirtualMachine")
			func isVirtualMachine() {
				#expect(SystemInformation.Hardware.Model.isVirtualMachine.testCondition)
			}

			@Test("isLaptop")
			func isLaptop() {
				#expect(SystemInformation.Hardware.Model.isLaptop.testCondition)
			}

			@Test("name")
			func name() async {
				#expect(await SystemInformation.Hardware.Model.name.testCondition)
			}

			@Test("localizedName")
			func localizedName() async {
				#expect(await SystemInformation.Hardware.Model.localizedName.testCondition)
			}

			@Test("displayName")
			func displayName() async {
				#expect(await SystemInformation.Hardware.Model.displayName.testCondition)
			}

			@Test("identifier")
			func identifier() async {
				#expect(await SystemInformation.Hardware.Model.identifier.testCondition)
			}

			@Test("namePrefix")
			func namePrefix() {
				#expect(SystemInformation.Hardware.Model.namePrefix.testCondition)
			}

			@Test("number")
			func number() async {
				#expect(await SystemInformation.Hardware.Model.number.testCondition)
			}

			@Test("regulatoryNumber")
			func regulatoryNumber() async {
				#expect(await SystemInformation.Hardware.Model.regulatoryNumber.testCondition)
			}

			@Test("sfSymbol")
			func sfSymbol() {
				#expect(SystemInformation.Hardware.Model.sfSymbol != .desktopcomputerAndMacbook)
			}
		}

		@Test("securityChip")
		func securityChip() async {
			#expect(await SystemInformation.Hardware.securityChip.testCondition)
		}

		@Suite("CPU")
		struct CPU {

			@Suite("Cores")
			struct Cores {

				@Test("differentTypes")
				func differentTypes() {
					#expect(SystemInformation.Hardware.CPU.Cores.differentTypes.testCondition)
				}

				@Test("total")
				func total() async {
					#expect(await SystemInformation.Hardware.CPU.Cores.total.testCondition)
				}

				@Test("performance")
				func performance() async {
					#expect(await SystemInformation.Hardware.CPU.Cores.performance.testCondition)
				}

				@Test("efficiency")
				func efficiency() async {
					#expect(await SystemInformation.Hardware.CPU.Cores.efficiency.testCondition)
				}
			}

			@Test("type")
			func type() async {
				#expect(await SystemInformation.Hardware.CPU.type.testCondition)
			}

			@Test("name")
			func name() async {
				#expect(await SystemInformation.Hardware.CPU.name.testCondition)
			}

			@Test("frequency")
			func frequency() async {
				#expect(await SystemInformation.Hardware.CPU.frequency.testCondition)
			}
		}

		@Test("memory")
		func memory() async {
			#expect(await SystemInformation.Hardware.memory.testCondition)
		}

		@Suite("Machine")
		struct Machine {

			@Test("serialNumber")
			func serialNumber() async {
				#expect(await SystemInformation.Hardware.Machine.serialNumber.testCondition)
			}

			@Test("hardwareUUID")
			func hardwareUUID() async {
				#expect(await SystemInformation.Hardware.Machine.hardwareUUID.testCondition)
			}

			@Test("provisioningUDID")
			func provisioningUDID() async {
				#expect(await SystemInformation.Hardware.Machine.provisioningUDID.testCondition)
			}
		}
	}
	// swiftformat:enable organizeDeclarations
	// swiftlint:enable type_contents_order
}
