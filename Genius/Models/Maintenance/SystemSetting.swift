//
// SystemSetting.swift
// Genius
//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

struct SystemSetting {

	static let iCloud = Self(
		systemPreferencesPane: "com.apple.preferences.AppleIDPrefPane",
		systemSettingsPane: "com.apple.systempreferences.AppleIDSettings",
		anchor: "iCloud",
	)
	static let firewall = Self(
		systemPreferencesPane: "com.apple.preference.security",
		systemSettingsPane: "com.apple.Network-Settings.extension",
		anchor: "Firewall",
	)
	static let softwareUpdate = Self(
		systemPreferencesPane: "com.apple.preferences.softwareupdate",
		systemSettingsPane: "com.apple.Software-Update-Settings.extension",
		anchor: { if #unavailable(macOS 15) { nil } else { "action=showAdvancedOptions" } }(),
	)
	static let security = Self(
		systemPreferencesPane: "com.apple.preference.security",
		systemSettingsPane: "com.apple.settings.PrivacySecurity.extension",
		anchor: { if #unavailable(macOS 13) { "General" } else { "Security" } }(),
	)
	static let fileVault = Self(
		systemPreferencesPane: "com.apple.preference.security",
		systemSettingsPane: "com.apple.settings.PrivacySecurity.extension",
		anchor: { if #unavailable(macOS 13) { "FDE" } else if #unavailable(macOS 14) { "Security" } else { "FileVault" } }(),
	)

	let pane: String
	let anchor: String?

	init(
		systemPreferencesPane: String,
		systemSettingsPane: String,
		anchor: String?,
	) {
		self.pane = if #unavailable(macOS 13) { systemPreferencesPane } else { systemSettingsPane }
		self.anchor = anchor
	}
}
