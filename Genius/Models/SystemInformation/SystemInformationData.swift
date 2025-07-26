//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import Foundation

struct SystemInformationData<
	Value: UIStringRepresentable,
	ValueWrapper: ValueWrapperProtocol<Value>,
>: SystemInformationProtocol, UIStringRepresentable {

	let valueWrapper: ValueWrapper
	let applicable: Bool?

	var uiRepresentation: String? { get async {
		if !?applicable ?? false {
			Defaults[.developmentMode] ? String(localized: .notApplicable) : nil
		} else if let uiRepresentation = await value.uiRepresentation {
			uiRepresentation
		} else {
			Defaults[.developmentMode] || Defaults[.interfaceMode] >= .advanced ? String(localized: .unknown) : nil
		}
	} }
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
