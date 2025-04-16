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

struct Symbol: View {

	let symbol: SFSymbol
	let color: Color
	let label: LocalizedStringKey

	var body: some View {
		Image(systemSymbol: symbol)
			.foregroundColor(color)
			.accessibilityLabel(Text(label))
	}
}
