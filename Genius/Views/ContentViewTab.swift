//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

enum ContentViewTab: String, TabData {

	case home = "Home"
	case systemInformation = "System Information"
	case maintenance = "Maintenance"
	case settings = "Settings"

	static let entireWindow = true // swiftlint:disable:this explicit_type_interface
	static let keyboardShortcutModifiers: EventModifiers = .command

	var body: some View {
		switch self {
			case .home: HomeView()
			case .systemInformation: SystemInformationView()
			case .maintenance: MaintenanceView()
			case .settings: SettingsView()
		}
	}
}
