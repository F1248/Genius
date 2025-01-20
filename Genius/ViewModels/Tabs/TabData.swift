//
// TabData.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency
import SwiftUICore

protocol TabData: RawRepresentable, CaseIterable, SelfIdentifiable where AllCases == [Self], RawValue == String {

	associatedtype ViewType: View

	static var entireWindow: Bool { get }
	static var keyboardShortcutModifiers: EventModifiers { get }
	@MainActor var content: ViewType { get }
}

extension TabData {

	static var id: String { String(describing: self) }
	@MainActor static var selection: Self? { allCases[safe: sharedData.selectedTabsIndices[id]] }
	var index: Int { Self.allCases.firstIndex(of: self) ?? 0 }
	var localizedString: String { rawValue.localized }
	var localizedStringKey: LocalizedStringKey { LocalizedStringKey(rawValue) }
}
