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
				"Line": SystemInformation.Hardware.Model.line,
				"Identifier": SystemInformation.Hardware.Model.identifier,
				"Number": SystemInformation.Hardware.Model.number,
				"Name": SystemInformation.Hardware.Model.name,
			],
			"Specifications": [
				"CPU Type": SystemInformation.Hardware.Specifications.CPU.type,
				"CPU Name": SystemInformation.Hardware.Specifications.CPU.name,
				"CPU Speed": SystemInformation.Hardware.Specifications.CPU.speed,
				"Total Cores": SystemInformation.Hardware.Specifications.CPU.Cores.total,
				"Performance Cores": SystemInformation.Hardware.Specifications.CPU.Cores.performance,
				"Efficiency Cores": SystemInformation.Hardware.Specifications.CPU.Cores.efficiency,
				"Memory": SystemInformation.Hardware.Specifications.memory,
			],
			"Machine": [
				"Serial Number": SystemInformation.Hardware.Machine.serialNumber,
				"Hardware UUID": SystemInformation.Hardware.Machine.hardwareUUID,
				"Provisioning UDID": SystemInformation.Hardware.Machine.provisioningUDID,
			],
		] } label: {
			Label("Hardware", systemImage: SystemInformation.Hardware.Model.systemImage)
		}
	}
}

#Preview {
	SystemInformationHardwareView()
}
