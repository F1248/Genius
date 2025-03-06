//
// SystemInformationData.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import SFSafeSymbols
import SwiftUICore

struct SystemInformationData<Value: Sendable> {

	let value: Value
	let applicable: Bool?

	init(_ value: Value) {
		self.value = value
		self.applicable = true
	}

	init<Wrapped>(_ value: @autoclosure () -> Value, applicable: Bool?) where Value == Wrapped? {
		self.value = applicable ?? true ? value() : nil
		self.applicable = applicable
	}
}

extension SystemInformationData: UIStringRepresentable where Value: UIStringRepresentable {

	var uiRepresentation: String? {
		if applicable ?? true {
			value.uiRepresentation ??
				(Defaults[.developmentMode] || Defaults[.interfaceMode] >= .advanced ? "Unknown".localized : nil)
		} else {
			Defaults[.developmentMode] ? "Not applicable".localized : nil
		}
	}
}

extension SystemInformationData: UISymbolRepresentable where Value: UISymbolRepresentable {

	var uiRepresentation: Symbol? {
		if applicable ?? true {
			value.uiRepresentation ??
				(
					Defaults[.developmentMode] || Defaults[.interfaceMode] >= .advanced ?
						Symbol(symbol: .questionmark, color: .red, label: "Unknown") : nil
				)
		} else {
			Defaults[.developmentMode] ? Symbol(symbol: .minus, color: .primary, label: "Not applicable") : nil
		}
	}
}
