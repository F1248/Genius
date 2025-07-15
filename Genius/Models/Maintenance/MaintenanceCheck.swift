//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import SFSafeSymbols
import SwiftUI

struct MaintenanceCheck<
	Value: PossiblyOptional & Sendable,
	ValueWrapper: ValueWrapperProtocol<Value>,
>: SystemInformationProtocol, UISymbolRepresentable where Value.Wrapped: Comparable & Maximizable & Sendable {

	typealias Wrapped = Value.Wrapped

	let valueWrapper: ValueWrapper
	let requirement: Wrapped
	let applicable: Bool?

	var uiRepresentation: Symbol? { get async {
		if !?applicable ?? false {
			Defaults[.developmentMode] ? Symbol(.minus, color: .primary, label: "Not applicable") : nil
		} else if let value = await value.optional {
			value >= requirement ? // swiftlint:disable:this void_function_in_ternary
				Symbol(.checkmark, color: .green, label: "Enabled") :
				Symbol(.xmark, color: .red, label: "Disabled")
		} else {
			Defaults[.developmentMode] || Defaults[.interfaceMode] >= .advanced ?
				Symbol(.questionmark, color: .red, label: "Unknown") : nil
		}
	} }
}

extension MaintenanceCheck where ValueWrapper == SyncValueWrapper<Value> {

	// periphery:ignore
	init(_ value: Value, requirement: Wrapped = .max) {
		self.valueWrapper = SyncValueWrapper(value: value)
		self.requirement = requirement
		self.applicable = true
	}

	init<Wrapped>(
		_ value: @autoclosure () -> Value,
		requirement: Wrapped = .max,
		applicable: Bool?,
	) where Value == Wrapped? {
		self.valueWrapper = SyncValueWrapper(value: applicable ?? true ? value() : nil)
		self.applicable = applicable
		self.requirement = requirement
	}
}

extension MaintenanceCheck where ValueWrapper == AsyncValueWrapper<Value> {

	// periphery:ignore
	init(_ valueClosure: @escaping @Sendable () async -> Value, requirement: Wrapped = .max) {
		self.valueWrapper = AsyncValueWrapper(valueClosure: valueClosure)
		self.requirement = requirement
		self.applicable = true
	}

	init<Wrapped>(
		_ valueClosure: @escaping @Sendable () async -> Value,
		requirement: Wrapped = .max,
		applicable: Bool?,
	) where Value == Wrapped? {
		self.valueWrapper = AsyncValueWrapper(
			valueClosure: applicable ?? true ? valueClosure : { @Sendable in nil },
		)
		self.requirement = requirement
		self.applicable = applicable
	}
}
