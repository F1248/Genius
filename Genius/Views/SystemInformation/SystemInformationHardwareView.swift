//
// SystemInformationHardwareView.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct SystemInformationHardwareView: View {

	var body: some View {
		SystemInformationTabView { [
			"Model": [
				"Name": SystemInformation.Hardware.Model.localizedName,
				"Identifier": SystemInformation.Hardware.Model.identifier,
				"Number": SystemInformation.Hardware.Model.number,
				"Regulatory Number": SystemInformation.Hardware.Model.regulatoryNumber,
			],
			"Specifications": [
				"Security Chip": SystemInformation.Hardware.securityChip,
				"CPU Type": SystemInformation.Hardware.CPU.type,
				"CPU Name": SystemInformation.Hardware.CPU.name,
				"CPU Frequency": SystemInformation.Hardware.CPU.frequency,
				SystemInformation.Hardware.CPU.Cores.differentTypes.value ?? true ? "Total Cores" : "Cores":
					SystemInformation.Hardware.CPU.Cores.total,
				"Performance Cores": SystemInformation.Hardware.CPU.Cores.performance,
				"Efficiency Cores": SystemInformation.Hardware.CPU.Cores.efficiency,
				"Memory": SystemInformation.Hardware.memory,
			],
			"Machine": [
				"Serial Number": SystemInformation.Hardware.Machine.serialNumber,
				"Hardware UUID": SystemInformation.Hardware.Machine.hardwareUUID,
				"Provisioning UDID": SystemInformation.Hardware.Machine.provisioningUDID,
			],
		] } label: {
			Label("Hardware", systemImage: SystemInformation.Hardware.Model.systemImage.value)
		}
	}
}

#Preview {
	SystemInformationHardwareView()
}
