//
// VaryingText.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct VaryingText: View {

	@AppStorage(Settings.InterfaceMode.key)
	var interfaceMode = Settings.InterfaceMode()

	let key: LocalizedStringKey
	let variesByInterfaceMode: Bool

	// swiftlint:disable:next type_contents_order
	init(_ key: LocalizedStringKey, variesByInterfaceMode: Bool = false) {
		self.key = key
		self.variesByInterfaceMode = variesByInterfaceMode
	}

	var body: some View {
		Text(key, tableName: variesByInterfaceMode ? interfaceMode.localizationTable : nil)
	}
}
