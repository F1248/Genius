//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

struct SyncValueWrapper<Value: Sendable>: ValueWrapperProtocol {

	let value: Value
}
