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

struct SystemInformationData<Value: Sendable, ValueWrapper: ValueWrapperProtocol<Value>> {

	let valueWrapper: ValueWrapper
	let applicable: Bool?

	var value: Value {
		valueWrapper.value
	}
}

extension SystemInformationData where ValueWrapper == SyncValueWrapper<Value> {

	init(_ value: Value) {
		self.valueWrapper = SyncValueWrapper(value: value)
		self.applicable = true
	}

	init<Wrapped>(_ value: @autoclosure () -> Value, applicable: Bool?) where Value == Wrapped? {
		self.valueWrapper = SyncValueWrapper(value: applicable ?? true ? value() : nil)
		self.applicable = applicable
	}
}

extension SystemInformationData: UIStringRepresentable
where Value: UIStringRepresentable, ValueWrapper == SyncValueWrapper<Value> {

	var uiRepresentation: String? {
		if applicable ?? true {
			value.uiRepresentation ??
				(Defaults[.developmentMode] || Defaults[.interfaceMode] >= .advanced ? "Unknown".localized : nil)
		} else {
			Defaults[.developmentMode] ? "Not applicable".localized : nil
		}
	}
}

extension SystemInformationData: UISymbolRepresentable
where Value: UISymbolRepresentable, ValueWrapper == SyncValueWrapper<Value> {

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
