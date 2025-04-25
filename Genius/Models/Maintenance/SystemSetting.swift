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
		systemPreferencesAnchor: "iCloud",
		systemSettingsAnchor: "iCloud",
	)
	static let firewall = Self(
		systemPreferencesPane: "com.apple.preference.security",
		systemSettingsPane: "com.apple.Network-Settings.extension",
		systemPreferencesAnchor: "Firewall",
		systemSettingsAnchor: "Firewall",
	)
	static let softwareUpdate = Self(
		systemPreferencesPane: "com.apple.preference.security",
		systemSettingsPane: "com.apple.Software-Update-Settings.extension",
		systemPreferencesAnchor: nil,
		systemSettingsAnchor: "action=showAdvancedOptions",
	)
	static let security = Self(
		systemPreferencesPane: "com.apple.preference.security",
		systemSettingsPane: "com.apple.settings.PrivacySecurity.extension",
		systemPreferencesAnchor: "General",
		systemSettingsAnchor: "Security",
	)
	static let fileVault = Self(
		systemPreferencesPane: "com.apple.preference.security",
		systemSettingsPane: "com.apple.settings.PrivacySecurity.extension",
		systemPreferencesAnchor: "FDE",
		systemSettingsAnchor: "FileVault",
	)

	let pane: String
	let anchor: String?

	init(
		systemPreferencesPane: String,
		systemSettingsPane: String,
		systemPreferencesAnchor: String?,
		systemSettingsAnchor: String?,
	) {
		if #unavailable(macOS 13) {
			self.pane = systemPreferencesPane
			self.anchor = systemPreferencesAnchor
		} else {
			self.pane = systemSettingsPane
			self.anchor = systemSettingsAnchor
		}
	}
}
