//
// © 2026 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

struct SoftwareUpdate {

	enum UpdateType {

		case macOS
		case safari

		init?(label: any StringProtocol) {
			if label.hasPrefix("macOS") {
				self = .macOS
			} else if label.hasPrefix("Safari") {
				self = .safari
			} else { return nil }
		}
	}

	let type: UpdateType?
	let version: VersionNumber?

	init(description: any StringProtocol) {
		let attributes = description.trimmingPrefix("* ").split(separator: ", ")
		self.type = (attributes.first { $0.hasPrefix("Label: ") }?.trimmingPrefix("Label: ")).flatMap(UpdateType.init)
		self.version = (attributes.first { $0.hasPrefix("Version: ") }?.trimmingPrefix("Version: ")).flatMap(VersionNumber.init)
	}
}
