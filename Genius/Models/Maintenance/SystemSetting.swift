//
// SystemSetting.swift
// Genius
//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

struct SystemSetting {

	static let iCloud = Self(
		systemSettingsPane: "com.apple.systempreferences.AppleIDSettings",
		anchor: "iCloud",
	)
	static let firewall = Self(
		systemSettingsPane: "com.apple.Network-Settings.extension",
		anchor: "Firewall",
	)
	static let softwareUpdate = Self(
		systemSettingsPane: "com.apple.Software-Update-Settings.extension",
		anchor: { if #unavailable(macOS 15) { nil } else { "action=showAdvancedOptions" } }(),
	)
	static let security = Self(
		systemSettingsPane: "com.apple.settings.PrivacySecurity.extension",
		anchor: "Security",
	)
	static let fileVault = Self(
		systemSettingsPane: "com.apple.settings.PrivacySecurity.extension",
		anchor: { if #unavailable(macOS 14) { "Security" } else { "FileVault" } }(),
	)

	let pane: String
	let anchor: String?

	init(
		systemSettingsPane: String,
		anchor: String?,
	) {
		self.pane = systemSettingsPane
		self.anchor = anchor
	}
}
