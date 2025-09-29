//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency

actor AsyncValueWrapper<Value: Sendable>: ValueWrapperProtocol {

	let valueClosure: @Sendable () async -> Value
	var pendingTask: Task<Value, Never>?
	var cachedValue: Value?

	var value: Value { get async {
		if let cachedValue { return cachedValue }
		if let pendingTask { return await pendingTask.value }
		let task = Task { await valueClosure() }
		pendingTask = task
		let value: Value = await task.value
		pendingTask = nil
		cachedValue = value
		return value
	} }

	init(valueClosure: @escaping @Sendable () async -> Value) {
		self.valueClosure = valueClosure
	}
}
