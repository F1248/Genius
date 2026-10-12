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
			if Defaults[.developmentMode] {
				String(localized: .unavailable)
			} else { .none }
		} else if let syncValue {
			if let syncValueUIRepresentation = syncValue.uiRepresentation {
				syncValueUIRepresentation
			} else {
				if Defaults[.developmentMode] || Defaults[.interfaceMode] >= .advanced {
					String(localized: .unknown)
				} else { .none }
			}
		} else {
			.some(nil)
		}
	}

	var uiRepresentation: String? { get async {
		if !?available ?? false {
			if Defaults[.developmentMode] {
				String(localized: .unavailable)
			} else { nil }
		} else if let valueUIRepresentation = await value.uiRepresentation {
			valueUIRepresentation
		} else {
			if Defaults[.developmentMode] || Defaults[.interfaceMode] >= .advanced {
				String(localized: .unknown)
			} else { nil }
		}
	} }
}

extension SystemInformationData where ValueWrapper == SyncValueWrapper<Value> {

	init(_ value: Value) {
		self.valueWrapper = SyncValueWrapper(value)
		self.available = true
	}

	init<Wrapped>(_ value: @autoclosure () -> Value, available: Bool?) where Value == Wrapped? {
		self.valueWrapper = SyncValueWrapper((available ?? true) ? value() : nil)
		self.available = available
	}
}

extension SystemInformationData where ValueWrapper == AsyncValueWrapper<Value> {

	init<Wrapped>(_ valueClosure: @escaping @Sendable () async -> Value, available: Bool?) where Value == Wrapped? {
		self.valueWrapper = AsyncValueWrapper((available ?? true) ? valueClosure : { @Sendable in nil })
		self.available = available
	}
}
