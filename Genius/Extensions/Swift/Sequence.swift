//
// Sequence.swift
// Genius
//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency

extension Sequence {

	func asyncMap<T>(
		_ transform: (Element) async -> T,
	) async -> [T] {
		var results = [T]()
		for element in self {
			await results.append(transform(element))
		}
		return results
	}

	func concurrentMap<T: Sendable>(
		_ transform: @escaping @Sendable (Element) async -> T,
	) async -> [T] where Element: Sendable {
		await map { element in
			Task {
				await transform(element)
			}
		}.asyncMap { await $0.value }
	}
}
