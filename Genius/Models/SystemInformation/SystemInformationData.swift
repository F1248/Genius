//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import Foundation

struct SystemInformationData<
	Value: UIStringRepresentable,
	ValueWrapper: ValueWrapperProtocol<Value>,
>: SystemInformationProtocol {

	let valueWrapper: ValueWrapper
	let available: Bool?

	var syncUIRepresentation: String?? {
		if !?available ?? false {
			Defaults[.developmentMode] ? String(localized: .notAvailable) : .none
		} else if let syncValue {
			if let uiRepresentation = syncValue.uiRepresentation {
				uiRepresentation
			} else {
				Defaults[.developmentMode] || Defaults[.interfaceMode] >= .advanced ? String(localized: .unknown) : .none
			}
		} else {
			.some(nil)
		}
	}

	var uiRepresentation: String? { get async {
		if !?available ?? false {
			Defaults[.developmentMode] ? String(localized: .notAvailable) : nil
		} else if let uiRepresentation = await value.uiRepresentation {
			uiRepresentation
		} else {
			Defaults[.developmentMode] || Defaults[.interfaceMode] >= .advanced ? String(localized: .unknown) : nil
		}
	} }
}

extension SystemInformationData where ValueWrapper == SyncValueWrapper<Value> {

	init(_ value: Value) {
		self.valueWrapper = SyncValueWrapper(wrappedValue: value)
		self.available = true
	}

	init<Wrapped>(_ value: @autoclosure () -> Value, available: Bool?) where Value == Wrapped? {
		self.valueWrapper = SyncValueWrapper(wrappedValue: available ?? true ? value() : nil)
		self.available = available
	}
}

extension SystemInformationData where ValueWrapper == AsyncValueWrapper<Value> {

	// periphery:ignore
	init(_ valueClosure: @escaping @Sendable () async -> Value) {
		self.valueWrapper = AsyncValueWrapper(valueClosure: valueClosure)
		self.available = true
	}

	init<Wrapped>(_ valueClosure: @escaping @Sendable () async -> Value, available: Bool?) where Value == Wrapped? {
		self.valueWrapper = AsyncValueWrapper(
			valueClosure: available ?? true ? valueClosure : { @Sendable in nil },
		)
		self.available = available
	}
}
