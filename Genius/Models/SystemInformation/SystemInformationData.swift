//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import SFSafeSymbols
import SwiftUI

struct SystemInformationData<Value, ValueWrapper: ValueWrapperProtocol<Value>>: SystemInformationProtocol {

	let valueWrapper: ValueWrapper
	let applicable: Bool?
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

extension SystemInformationData where ValueWrapper == AsyncValueWrapper<Value> {

	init(_ valueClosure: @escaping @Sendable () async -> Value) {
		self.valueWrapper = AsyncValueWrapper(valueClosure: valueClosure)
		self.applicable = true
	}

	init<Wrapped>(_ valueClosure: @escaping @Sendable () async -> Value, applicable: Bool?) where Value == Wrapped? {
		self.valueWrapper = AsyncValueWrapper(
			valueClosure: applicable ?? true ? valueClosure : { @Sendable in nil },
		)
		self.applicable = applicable
	}
}

extension SystemInformationData: UIStringRepresentable where Value: UIStringRepresentable {

	var uiRepresentation: String? { get async {
		if !?applicable ?? false {
			Defaults[.developmentMode] ? "Not applicable".localized : nil
		} else if let uiRepresentation = await value.uiRepresentation {
			uiRepresentation
		} else {
			Defaults[.developmentMode] || Defaults[.interfaceMode] >= .advanced ? "Unknown".localized : nil
		}
	} }
}

extension SystemInformationData: UISymbolRepresentable where Value: UISymbolRepresentable {

	var uiRepresentation: Symbol? { get async {
		if !?applicable ?? false {
			Defaults[.developmentMode] ? Symbol(.minus, color: .primary, label: "Not applicable") : nil
		} else if let uiRepresentation = await value.uiRepresentation {
			uiRepresentation
		} else {
			Defaults[.developmentMode] || Defaults[.interfaceMode] >= .advanced ?
				Symbol(.questionmark, color: .red, label: "Unknown") : nil
		}
	} }
}
