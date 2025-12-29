//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency

protocol SystemInformationProtocol<Representation>: Sendable {

	associatedtype Value
	associatedtype ValueWrapper: ValueWrapperProtocol<Value>
	associatedtype Representation

	var valueWrapper: ValueWrapper { get }
	var available: Bool? { get }
	@MainActor var syncUIRepresentation: Representation?? { get }
	@MainActor var uiRepresentation: Representation? { get async }
}

extension SystemInformationProtocol {

	var value: Value { get async {
		await valueWrapper.wrappedValue
	} }

	@MainActor var syncValue: Value? {
		valueWrapper.syncWrappedValue
	}
}

extension SystemInformationProtocol where ValueWrapper == SyncValueWrapper<Value> {

	var value: Value {
		valueWrapper.wrappedValue
	}
}
