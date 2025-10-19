//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

struct SystemInformationHardwareView: View {

	var body: some View {
		SystemInformationTabView(content: [
			.model: [
				.name: SystemInformation.Hardware.Model.displayName,
				.identifier: SystemInformation.Hardware.Model.identifier,
				.number: SystemInformation.Hardware.Model.number,
				.regulatoryNumber: SystemInformation.Hardware.Model.regulatoryNumber,
			],
			.specifications: [
				.securityChip: SystemInformation.Hardware.securityChip,
				.cpuType: SystemInformation.Hardware.CPU.type,
				.cpuName: SystemInformation.Hardware.CPU.name,
				.cpuFrequency: SystemInformation.Hardware.CPU.frequency,
				SystemInformation.Hardware.CPU.Cores.differentTypes ?? true ? .totalCores : .cores:
					SystemInformation.Hardware.CPU.Cores.total,
				.performanceCores: SystemInformation.Hardware.CPU.Cores.performance,
				.efficiencyCores: SystemInformation.Hardware.CPU.Cores.efficiency,
				.memory: SystemInformation.Hardware.memory,
			],
			.machine: [
				.serialNumber: SystemInformation.Hardware.Machine.serialNumber,
				.hardwareUUID: SystemInformation.Hardware.Machine.hardwareUUID,
				.provisioningUDID: SystemInformation.Hardware.Machine.provisioningUDID,
			],
		])
	}
}

#Preview {
	SystemInformationHardwareView()
		.frame(width: 712, height: 256)
}
