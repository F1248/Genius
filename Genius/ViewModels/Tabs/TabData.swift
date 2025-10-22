//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import SFSafeSymbols
import SwiftUI

protocol TabData: View, CaseIterable, Equatable, SelfIdentifiable where AllCases == [Self] {

	associatedtype ContentViewType: View

	static var entireWindow: Bool { get }
	static var keyboardShortcutModifiers: EventModifiers { get }

	var title: LocalizedStringResource { get }
	var displayTitleInBody: Bool { get }
	var symbol: SFSymbol { get }

	@ViewBuilder var content: ContentViewType { get }
}

extension TabData {

	static var id: ObjectIdentifier { ObjectIdentifier(self) }

	@ViewBuilder static var commands: some View {
		ForEach(allCases.filter { $0 as? ContentViewTab != .settings }, content: \.command)
		Divider()
	}

	@ViewBuilder var body: some View {
		VStack {
			if displayTitleInBody {
				Label(title, systemImage: symbol.rawValue)
					.font(.title)
					.padding()
			}
			content
		}
	}

	@ViewBuilder var command: some View {
		Button(
			self as? ContentViewTab == .settings ? .settingsEllipsis : title,
			systemImage: symbol.rawValue,
		) {
			SharedData.shared.selectedTabsIndices[Self.id] = index
		}
		.keyboardShortcut(
			self as? ContentViewTab == .settings ? "," : KeyEquivalent(Character(String(index + 1))),
			modifiers: Self.keyboardShortcutModifiers,
		)
	}
}
