//
// Symbol.swift
// Genius
//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SFSafeSymbols
import SwiftUI
import SwiftUICore

struct Symbol {

	let symbol: SFSymbol
	let color: Color
	let label: LocalizedStringKey

	var image: some View {
		Image(systemSymbol: symbol)
			.accessibilityLabel(Text(label))
			.foregroundColor(color)
	}
}
