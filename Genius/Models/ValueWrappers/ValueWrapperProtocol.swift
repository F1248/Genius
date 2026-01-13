//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency

protocol ValueWrapperProtocol<Value>: Sendable {

	associatedtype Value

	var wrappedValue: Value { get async }
	@MainActor var syncWrappedValue: Value? { get }
}
