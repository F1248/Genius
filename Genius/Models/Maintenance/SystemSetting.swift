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
		anchor: "Firewall", // does not work on macOS 13 and newer
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
	static let accessories = Self(
		systemSettingsPane: "com.apple.settings.PrivacySecurity.extension",
		anchor: { if #unavailable(macOS 15.4) { "Security" } else { "Accessories" } }(),
	)

	let pane: String
	let anchor: String?

	init(
		systemPreferencesPane: String? = nil,
		systemSettingsPane: String,
		anchor: String?,
	) {
		self.pane = if #unavailable(macOS 13) { systemPreferencesPane ?? systemSettingsPane } else { systemSettingsPane }
		self.anchor = anchor
	}
}
