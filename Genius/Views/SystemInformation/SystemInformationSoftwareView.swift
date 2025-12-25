//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import SwiftUI

struct SystemInformationSoftwareView: View {

	var body: some View {
		FormView<LocalizedStringResource, _>(content: [
			.smc: [
				.version: SystemInformation.Software.SMC.version,
			],
			.firmware: [
				.version: SystemInformation.Software.Firmware.version,
			],
			.kernel: [
				.name: SystemInformation.Software.Kernel.name,
				.version: SystemInformation.Software.Kernel.version,
			],
			.macOS: [
				.version: SystemInformation.Software.OS.version,
				.codeName: SystemInformation.Software.OS.codeName,
				.buildNumber: SystemInformation.Software.OS.buildNumber,
				.bootMode: SystemInformation.Software.OS.bootMode,
				.bootVolume: SystemInformation.Software.OS.bootVolume,
				.loaderVersion: SystemInformation.Software.OS.loaderVersion,
			],
			.computer: [
				.name: SystemInformation.Software.Computer.name,
				.hostname: SystemInformation.Software.Computer.hostName,
			],
			.user: [
				.name: SystemInformation.Software.User.name,
				.accountName: SystemInformation.Software.User.accountName,
			],
		])
	}
}

#Preview {
	SystemInformationSoftwareView()
		.frame(width: 712, height: 256)
}
