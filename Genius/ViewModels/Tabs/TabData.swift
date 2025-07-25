//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SFSafeSymbols
import SwiftUI

protocol TabData: View, RawRepresentable<String>, CaseIterable, Equatable, SelfIdentifiable where AllCases == [Self] {

	associatedtype ContentViewType: View

	static var entireWindow: Bool { get }
	static var keyboardShortcutModifiers: EventModifiers { get }

	var displayTitleInBody: Bool { get }
	var symbol: SFSymbol { get }

	@ViewBuilder var content: ContentViewType { get }
}

extension TabData {

	static var id: ObjectIdentifier { ObjectIdentifier(self) }

	var localized: String { rawValue.localized }
	var localizedStringKey: LocalizedStringKey { LocalizedStringKey(rawValue) }

	@ViewBuilder var body: some View {
		if displayTitleInBody {
			Label {
				Text(varying: localizedStringKey)
			} icon: {
				Image(systemSymbol: symbol)
			}
			.font(.title)
			.padding()
		}
		content
	}
}
