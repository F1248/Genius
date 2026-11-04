//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

protocol SystemInformationProtocol: Sendable {

	associatedtype Value
	associatedtype ValueWrapper: ValueWrapperProtocol<Value>

	var valueWrapper: ValueWrapper { get }
	var available: Bool? { get }
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
