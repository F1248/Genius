//
// SystemSetting.swift
// Genius
//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

struct SystemSetting {

	static let iCloud = Self(
		pane: "com.apple.systempreferences.AppleIDSettings",
		anchor: "iCloud",
	)
	static let firewall = Self(
		pane: "com.apple.Network-Settings.extension",
		anchor: "Firewall", // does not work
	)
	static let softwareUpdate = Self(
		pane: "com.apple.Software-Update-Settings.extension",
		anchor: { if #unavailable(macOS 15) { nil } else { "action=showAdvancedOptions" } }(),
	)
	static let security = Self(
		pane: "com.apple.settings.PrivacySecurity.extension",
		anchor: "Security",
	)
	static let fileVault = Self(
		pane: "com.apple.settings.PrivacySecurity.extension",
		anchor: { if #unavailable(macOS 14) { "Security" } else { "FileVault" } }(),
	)
	static let accessories = Self(
		pane: "com.apple.settings.PrivacySecurity.extension",
		anchor: { if #unavailable(macOS 15.4) { "Security" } else { "Accessories" } }(),
	)

	let pane: String
	let anchor: String?
}
