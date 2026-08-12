//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import SFSafeSymbols
import SwiftUI

enum ContentViewTab: @MainActor TabData {

	case home
	case systemInformation
	case recommendations
	case settings

	static let entireWindow: Bool = true
	static let keyboardShortcutModifiers: EventModifiers = .command

	var title: LocalizedStringResource { switch self {
		case .home: .home
		case .systemInformation: .systemInformation
		case .recommendations: .recommendations
		case .settings: .settings
	} }

	var commandTitle: LocalizedStringResource { switch self {
		case .settings: .settingsEllipsis
		default: title
	} }

	var keyEquivalent: KeyEquivalent { switch self {
		case .settings: ","
		default: KeyEquivalent(Character(String(index + 1)))
	} }

	var includeInCommands: Bool { switch self {
		case .settings: false
		default: true
	} }

	var displayTitleInBody: Bool { switch self {
		case .home: false
		default: true
	} }

	var symbol: SFSymbol { switch self {
		case .home: .house
		case .systemInformation: if #available(macOS 15.4, *) { .infoCircleTextPage } else { .infoCircle }
		case .recommendations: .docTextBelowEcg
		case .settings: .gear
	} }

	var content: some View { switch self {
		case .home: HomeView()
		case .systemInformation: SystemInformationView()
		case .recommendations: RecommendationsView()
		case .settings: SettingsView()
	} }
}
