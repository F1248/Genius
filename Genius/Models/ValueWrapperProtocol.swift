//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

protocol ValueWrapperProtocol<Value>: Sendable {

	associatedtype Value

	var value: Value { get async }
}
