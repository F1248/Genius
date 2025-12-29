//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@propertyWrapper
struct SyncValueWrapper<Value: Sendable>: ValueWrapperProtocol {

	let wrappedValue: Value

	var syncWrappedValue: Value? { wrappedValue }
}
