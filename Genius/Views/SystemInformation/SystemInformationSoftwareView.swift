//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

struct SystemInformationSoftwareView: View {

	var body: some View {
		SystemInformationTabView(content: [
			"SMC": [
				"Version": SystemInformation.Software.SMC.version,
			],
			"Firmware": [
				"Version": SystemInformation.Software.Firmware.version,
			],
			"Kernel": [
				"Name": SystemInformation.Software.Kernel.name,
				"Version": SystemInformation.Software.Kernel.version,
			],
			"macOS": [
				"Version": SystemInformation.Software.OS.version,
				"Code Name": SystemInformation.Software.OS.codeName,
				"Build Number": SystemInformation.Software.OS.buildNumber,
				"Boot Mode": SystemInformation.Software.OS.bootMode,
				"Boot Volume": SystemInformation.Software.OS.bootVolume,
				"Loader Version": SystemInformation.Software.OS.loaderVersion,
			],
			"Computer": [
				"Name": SystemInformation.Software.Computer.name,
				"Hostname": SystemInformation.Software.Computer.hostName,
			],
			"User": [
				"Name": SystemInformation.Software.User.name,
				"Account Name": SystemInformation.Software.User.accountName,
			],
		])
	}
}

#Preview {
	SystemInformationSoftwareView()
		.frame(width: 686, height: 256)
}
