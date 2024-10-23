//
// Setting.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

protocol Setting {

	init()
}

extension Setting {

	static var key: String { String(describing: self) }
}

extension Setting where Self: Identifiable {

	var id: Self { self } // swiftlint:disable:this unused_declaration
}

extension Setting where Self: RawRepresentable, RawValue == String {

	static var value: Self {
		// swiftformat:disable redundantProperty
		@AppStorage(key)
		var value = Self() // swiftlint:disable:this direct_return
		// swiftformat:enable redundantProperty
		return value
	}

	var localizedString: String { rawValue.localized() }
	var localizedStringKey: LocalizedStringKey { LocalizedStringKey(rawValue) }
}
