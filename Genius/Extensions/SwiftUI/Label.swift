//
// Label.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency
import SwiftUI
import SwiftUICore

extension Label {

	@MainActor
	init(_ titleKey: LocalizedStringKey, variesByInterfaceMode: Bool = false) where Title == VaryingText, Icon == EmptyView {
		self.init {
			VaryingText(titleKey, variesByInterfaceMode: variesByInterfaceMode)
		} icon: {
			EmptyView()
		}
	}
}
