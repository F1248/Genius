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

struct SystemInformationData<Value, ValueWrapper: ValueWrapperProtocol<Value>>: Sendable {

	let valueWrapper: ValueWrapper
	let applicable: Bool?

	var value: Value {
		get async { await valueWrapper.value }
	}
}

extension SystemInformationData where ValueWrapper == SyncValueWrapper<Value> {

	var value: Value {
		valueWrapper.value
	}

	init(_ value: Value) {
		self.valueWrapper = SyncValueWrapper(value: value)
		self.applicable = true
	}

	init<Wrapped>(_ value: @autoclosure () -> Value, applicable: Bool?) where Value == Wrapped? {
		self.valueWrapper = SyncValueWrapper(value: applicable ?? true ? value() : nil)
		self.applicable = applicable
	}
}

// periphery:ignore
extension SystemInformationData where ValueWrapper == AsyncValueWrapper<Value> {

	init(_ valueClosure: @escaping @Sendable () async -> Value) {
		self.valueWrapper = AsyncValueWrapper(valueClosure: valueClosure)
		self.applicable = true
	}

	init<Wrapped>(_ valueClosure: @escaping @Sendable () async -> Value, applicable: Bool?) where Value == Wrapped? {
		self.valueWrapper = AsyncValueWrapper(
			valueClosure: applicable ?? true ? valueClosure : { @Sendable in nil }
		)
		self.applicable = applicable
	}
}

extension SystemInformationData: UIStringRepresentable where Value: UIStringRepresentable {

	var uiRepresentation: String? {
		get async {
			if applicable ?? true {
				await value.uiRepresentation ??
					(Defaults[.developmentMode] || Defaults[.interfaceMode] >= .advanced ? "Unknown".localized : nil)
			} else {
				Defaults[.developmentMode] ? "Not applicable".localized : nil
			}
		}
	}
}

extension SystemInformationData: UISymbolRepresentable where Value: UISymbolRepresentable {

	var uiRepresentation: Symbol? {
		get async {
			if applicable ?? true {
				await value.uiRepresentation ??
					(
						Defaults[.developmentMode] || Defaults[.interfaceMode] >= .advanced ?
							Symbol(symbol: .questionmark, color: .red, label: "Unknown") : nil
					)
			} else {
				Defaults[.developmentMode] ? Symbol(symbol: .minus, color: .primary, label: "Not applicable") : nil
			}
		}
	}
}
