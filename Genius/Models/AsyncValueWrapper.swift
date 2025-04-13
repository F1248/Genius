//
// AsyncValueWrapper.swift
// Genius
//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

// periphery:ignore
actor AsyncValueWrapper<Value: Sendable>: ValueWrapperProtocol {

	let valueClosure: () async -> Value
	var cachedValue: Value?

	var value: Value {
		get async {
			if let cachedValue { return cachedValue }
			let value: Value = await valueClosure()
			cachedValue = value
			return value
		}
	}

	init(valueClosure: @escaping @Sendable () async -> Value) {
		self.valueClosure = valueClosure
	}
}
