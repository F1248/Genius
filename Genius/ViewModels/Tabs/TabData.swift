//
// TabData.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUICore

protocol TabData: RawRepresentable, CaseIterable, Identifiable, Equatable, Sendable
where AllCases: RandomAccessCollection, RawValue == String {

	static var entireWindow: Bool { get }
	static var keyboardShortcutModifiers: EventModifiers { get }
	var variesByInterfaceMode: Bool { get }
	var content: AnyView { get }
}

extension TabData {

	static var id: String { String(describing: self) }
	var id: Self { self } // swiftlint:disable:this unused_declaration
	var index: Int { Self.allCases.firstIndex(of: self) as? Int ?? 0 }
	var localizedString: String { rawValue.localized(variesByInterfaceMode: variesByInterfaceMode) }
	var localizedStringKey: LocalizedStringKey { LocalizedStringKey(rawValue) }
}
