//
// VaryingText.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import SwiftUICore

struct VaryingText: View {

	@Default(.interfaceMode)
	var interfaceMode: Settings.InterfaceMode

	let key: LocalizedStringKey

	// swiftlint:disable:next type_contents_order
	init(_ key: LocalizedStringKey) {
		self.key = key
	}

	var body: some View {
		Text(key, tableName: key.key.isContainedInDefaultLocalizationTable ? interfaceMode.localizationTable : nil)
	}
}
