//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

struct SystemSetting: Openable {

	static let findMyMac = Self(
		pane: "com.apple.systempreferences.AppleIDSettings",
		anchor: {
			if #available(macOS 26, *) {
				"email/prefs/storage?root=APPLE_ACCOUNT&path=ICLOUD_SERVICE&dataclassId=com.apple.Dataclass.DeviceLocator"
			} else {
				"iCloud"
			}
		}(),
	)
	static let firewall = Self(
		pane: "com.apple.Network-Settings.extension",
		anchor: "Firewall", // does not work
	)
	static let softwareUpdate = Self(
		pane: "com.apple.Software-Update-Settings.extension",
		anchor: { if #available(macOS 15, *) { "action=showAdvancedOptions" } else { nil } }(),
	)
	static let security = Self(
		pane: "com.apple.settings.PrivacySecurity.extension",
		anchor: "Security",
	)
	static let fileVault = Self(
		pane: "com.apple.settings.PrivacySecurity.extension",
		anchor: { if #available(macOS 14, *) { "FileVault" } else { "Security" } }(),
	)
	static let accessories = Self(
		pane: "com.apple.settings.PrivacySecurity.extension",
		anchor: { if #available(macOS 15.4, *) { "Accessories" } else { "Security" } }(),
	)
	static let backgroundSecurityImprovements = Self(
		pane: "com.apple.settings.PrivacySecurity.extension",
		anchor: "SecurityImprovements",
	)

	let url: URL

	init?(pane: String, anchor: String?) {
		guard
			(SystemInformation.Software.OS.bootMode.value !=? .recovery) ?? true,
			let createdURL = URL(string: "x-apple.systempreferences:\(pane)\(anchor.map { "?\($0)" } ?? "")")
		else { return nil }
		self.url = createdURL
	}

	func open() {
		url.open()
	}
}
