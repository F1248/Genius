//
// CustomTab.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency
import SwiftUICore

struct CustomTab {

	let title: VaryingText
	let index: Int
	let content: AnyView

	@MainActor
	init(
		_ titleKey: LocalizedStringKey,
		index: Int,
		content: () -> some View
	) {
		self.title = VaryingText(titleKey)
		self.index = index
		self.content = AnyView(content())
	}
}
