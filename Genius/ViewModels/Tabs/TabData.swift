//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency
import SwiftUI

protocol TabData: RawRepresentable<String>, CaseIterable, SelfIdentifiable where AllCases == [Self] {

	associatedtype ViewType: View

	static var entireWindow: Bool { get }
	static var keyboardShortcutModifiers: EventModifiers { get }
	@MainActor @ViewBuilder var content: ViewType { get }
}

extension TabData {

	static var id: String { String(describing: self) }
	var localized: String { rawValue.localized }
	var localizedStringKey: LocalizedStringKey { LocalizedStringKey(rawValue) }
}
