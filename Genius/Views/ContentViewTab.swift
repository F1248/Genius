//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency
import Foundation
import SFSafeSymbols
import SwiftUI

enum ContentViewTab: @MainActor TabData {

	case home
	case systemInformation
	case maintenance
	case settings

	static let entireWindow: Bool = true
	static let keyboardShortcutModifiers: EventModifiers = .command

	var title: LocalizedStringResource { switch self {
		case .home: .home
		case .systemInformation: .systemInformation
		case .maintenance: .maintenance
		case .settings: .settings
	} }

	var displayTitleInBody: Bool { switch self {
		case .home: false
		default: true
	} }

	var symbol: SFSymbol { switch self {
		case .home: .house
		case .systemInformation:
			if #available(macOS 15.4, *) { SFSymbol(rawValue: "info.circle.text.page") } else { .docTextBelowEcg }
		case .maintenance: .stethoscope
		case .settings: .gear
	} }

	var content: some View { switch self {
		case .home: HomeView()
		case .systemInformation: SystemInformationView()
		case .maintenance: MaintenanceView()
		case .settings: SettingsView()
	} }
}
