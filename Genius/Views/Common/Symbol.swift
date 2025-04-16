//
// Symbol.swift
// Genius
//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import SFSafeSymbols
import SwiftUI
import SwiftUICore

struct Symbol: View {

	let symbol: SFSymbol
	let color: Color
	let label: LocalizedStringKey

	var body: some View {
		if Defaults[.useTextInsteadOfSymbols] {
			Text(label)
		} else {
			Image(systemSymbol: symbol)
				.foregroundColor(color)
				.frame(width: 14)
				.accessibilityLabel(Text(label))
		}
	}
}
