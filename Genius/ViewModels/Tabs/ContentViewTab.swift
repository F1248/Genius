//
// ContentViewTab.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUICore

enum ContentViewTab: String, TabData {

	case home = "Home"
	case systemInformation = "System Information"
	case maintenance = "Maintenance"
	case settings = "Settings"

	static let entireWindow = true // swiftlint:disable:this explicit_type_interface
	static let keyboardShortcutModifiers: EventModifiers = .command

	var variesByInterfaceMode: Bool {
		switch self {
		case .systemInformation: true
		default: false
		}
	}

	var content: AnyView {
		switch self {
		case .home: AnyView(HomeView())
		case .systemInformation: AnyView(SystemInformationView())
		case .maintenance: AnyView(MaintenanceView())
		case .settings: AnyView(SettingsView())
		}
	}
}
