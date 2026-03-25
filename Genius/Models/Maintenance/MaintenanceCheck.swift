//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import Foundation
import SFSafeSymbols
import SwiftUI

struct MaintenanceCheck<
	Value: PossiblyOptional & Sendable,
	ValueWrapper: ValueWrapperProtocol<Value>,
>: SystemInformationProtocol where Value.Wrapped: Comparable & Maximizable & Sendable {

	typealias Wrapped = Value.Wrapped

	let valueWrapper: ValueWrapper
	let requirement: Wrapped
	let available: Bool?

	var syncUIRepresentation: Symbol?? {
		if !?available ?? false {
			Defaults[.developmentMode] ? Symbol(.minus, color: .primary, label: .unavailable) : .none
		} else if let syncValue {
			if let value = syncValue.optional {
				if value >= requirement {
					Defaults[.showPassedMaintenanceChecks] ? Symbol(.checkmark, color: .green, label: .passed) : nil
				} else {
					Symbol(.xmark, color: .red, label: .failed)
				}
			} else {
				Defaults[.developmentMode] || Defaults[.interfaceMode] >= .advanced ?
					Symbol(.questionmark, color: .red, label: .unknown) :
					.none
			}
		} else {
			.some(nil)
		}
	}

	var uiRepresentation: Symbol? { get async {
		if !?available ?? false {
			Defaults[.developmentMode] ? Symbol(.minus, color: .primary, label: .unavailable) : nil
		} else if let value = await value.optional {
			if value >= requirement {
				Defaults[.showPassedMaintenanceChecks] ? Symbol(.checkmark, color: .green, label: .passed) : nil
			} else {
				Symbol(.xmark, color: .red, label: .failed)
			}
		} else {
			Defaults[.developmentMode] || Defaults[.interfaceMode] >= .advanced ?
				Symbol(.questionmark, color: .red, label: .unknown) : nil
		}
	} }
}

extension MaintenanceCheck where ValueWrapper == SyncValueWrapper<Value> {

	// periphery:ignore
	init(_ value: Value, requirement: Wrapped = .max) {
		self.valueWrapper = SyncValueWrapper(wrappedValue: value)
		self.requirement = requirement
		self.available = true
	}

	init<Wrapped>(
		_ value: @autoclosure () -> Value,
		requirement: Wrapped = .max,
		available: Bool?,
	) where Value == Wrapped? {
		self.valueWrapper = SyncValueWrapper(wrappedValue: available ?? true ? value() : nil)
		self.available = available
		self.requirement = requirement
	}

	init<Wrapped>(
		defaultsDomain: String,
		key: String,
		default defaultValue: Wrapped,
		requirement: Wrapped = .max,
		available: Bool? = true,
	) where Value == Wrapped? {
		self.available = SystemInformation.Software.OS.bootMode.value !=? .recovery &&? available
		self.valueWrapper = SyncValueWrapper(
			wrappedValue: self.available ?? true ?
				UserDefaults(suiteName: defaultsDomain)?.read(key: key, default: defaultValue) : nil,
		)
		self.requirement = requirement
	}
}

extension MaintenanceCheck where ValueWrapper == AsyncValueWrapper<Value> {

	// periphery:ignore
	init(_ valueClosure: @escaping @Sendable () async -> Value, requirement: Wrapped = .max) {
		self.valueWrapper = AsyncValueWrapper(valueClosure)
		self.requirement = requirement
		self.available = true
	}

	init<Wrapped>(
		_ valueClosure: @escaping @Sendable () async -> Value,
		requirement: Wrapped = .max,
		available: Bool?,
	) where Value == Wrapped? {
		self.valueWrapper = AsyncValueWrapper(
			available ?? true ? valueClosure : { @Sendable in nil },
		)
		self.requirement = requirement
		self.available = available
	}
}
