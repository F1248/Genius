//
// CaseIterableSetting.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

protocol CaseIterableSetting: CaseIterable, RawRepresentable, Setting {

	init()
}

extension CaseIterableSetting where RawValue == String {

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
