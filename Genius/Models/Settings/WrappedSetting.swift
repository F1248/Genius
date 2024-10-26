//
// WrappedSetting.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

protocol WrappedSetting: Setting {

	associatedtype WrappedValue

	static var defaultValue: WrappedValue { get }
}

extension WrappedSetting where WrappedValue == Bool {

	static var value: WrappedValue {
		// swiftformat:disable redundantProperty
		@AppStorage(key)
		var value: WrappedValue = defaultValue // swiftlint:disable:this direct_return
		// swiftformat:enable redundantProperty
		return value
	}
}
