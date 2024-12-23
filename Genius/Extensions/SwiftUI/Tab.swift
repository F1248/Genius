//
// Tab.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency
import SwiftUI
import SwiftUICore

extension Tab where Value: Hashable, Content: View {

	@MainActor
	init(
		_ titleKey: LocalizedStringKey,
		value: Value,
		content: () -> Content
	) where Label == VaryingText {
		self.init(value: value, content: content) {
			VaryingText(titleKey)
		}
	}
}
