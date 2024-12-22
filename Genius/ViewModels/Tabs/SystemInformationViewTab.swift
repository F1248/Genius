//
// SystemInformationViewTab.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

enum SystemInformationViewTab: String, TabData {

	case hardware = "Hardware"
	case software = "Software"

	static let entireWindow = false // swiftlint:disable:this explicit_type_interface
	static let keyboardShortcutModifiers: EventModifiers = [.command, .option]

	var variesByInterfaceMode: Bool {
		switch self {
			default: false
		}
	}

	@ViewBuilder var content: some View {
		switch self {
			case .hardware: SystemInformationHardwareView()
			case .software: SystemInformationSoftwareView()
		}
	}
}

#Preview {
	AdaptingTabView(tabData: SystemInformationViewTab.self)
}
