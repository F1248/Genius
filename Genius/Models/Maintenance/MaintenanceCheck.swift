//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency
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
			Defaults[.developmentMode] ? Symbol(.minus, color: .primary, label: .notApplicable) : nil
		} else if let value = await value.optional {
			value >= requirement ? // swiftlint:disable:this void_function_in_ternary
				Symbol(.checkmark, color: .green, label: .enabled) :
				Symbol(.xmark, color: .red, label: .disabled)
		} else {
			Defaults[.developmentMode] || Defaults[.interfaceMode] >= .advanced ?
				Symbol(.questionmark, color: .red, label: .unknown) : nil
		}
	} }
}

extension MaintenanceCheck where ValueWrapper == SyncValueWrapper<Value> {

	@MainActor var uiRepresentation: Symbol? {
		if !?applicable ?? false {
			Defaults[.developmentMode] ? Symbol(.minus, color: .primary, label: .notApplicable) : nil
		} else if let value = value.optional {
			value >= requirement ? // swiftlint:disable:this void_function_in_ternary
				Symbol(.checkmark, color: .green, label: .enabled) :
				Symbol(.xmark, color: .red, label: .disabled)
		} else {
			Defaults[.developmentMode] || Defaults[.interfaceMode] >= .advanced ?
				Symbol(.questionmark, color: .red, label: .unknown) : nil
		}
	}

	// periphery:ignore
	init(_ value: Value, requirement: Wrapped = .max) {
		self.valueWrapper = SyncValueWrapper(wrappedValue: value)
		self.requirement = requirement
		self.applicable = true
	}

	init<Wrapped>(
		_ value: @autoclosure () -> Value,
		requirement: Wrapped = .max,
		applicable: Bool?,
	) where Value == Wrapped? {
		self.valueWrapper = SyncValueWrapper(wrappedValue: applicable ?? true ? value() : nil)
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
