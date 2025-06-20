//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

protocol TabData: View, RawRepresentable<String>, CaseIterable, SelfIdentifiable where AllCases == [Self] {

	static var entireWindow: Bool { get }
	static var keyboardShortcutModifiers: EventModifiers { get }
}

extension TabData {

	static var id: ObjectIdentifier { ObjectIdentifier(self) }

	var localized: String { rawValue.localized }
	var localizedStringKey: LocalizedStringKey { LocalizedStringKey(rawValue) }
}
