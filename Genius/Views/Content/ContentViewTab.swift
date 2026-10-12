//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import SFSafeSymbols
import SwiftUI

enum ContentViewTab: @MainActor TabData {

	case recommendations
	case systemInformation
	case settings

	static let entireWindow: Bool = true
	static let keyboardShortcutModifiers: EventModifiers = .command

	var title: LocalizedStringResource { switch self {
		case .recommendations: .recommendations
		case .systemInformation: .systemInformation
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

	var symbol: SFSymbol { switch self {
		case .recommendations: .docTextBelowEcg
		case .systemInformation: if #available(macOS 15.4, *) { .infoCircleTextPage } else { .infoCircle }
		case .settings: .gear
	} }

	var largeSymbol: SFSymbol { switch self {
		case .recommendations: .waveformPathEcg
		case .systemInformation: .info
		default: symbol
	} }

	var content: some View { switch self {
		case .recommendations: RecommendationsView()
		case .systemInformation: SystemInformationView()
		case .settings: SettingsView()
	} }
}
