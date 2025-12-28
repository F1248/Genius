//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency

extension Sequence {

	func asyncMap<Result>(
		_ transform: (Element) async -> Result,
	) async -> [Result] {
		var results: [Result] = []
		for element in self {
			await results.append(transform(element))
		}
		return results
	}

	func concurrentMap<Result: Sendable>(
		_ transform: @escaping @Sendable (Element) async -> Result,
	) async -> [Result] where Self: Sendable, Element: Sendable {
		await map { element in
			Task {
				await transform(element)
			}
		}.asyncMap { await $0.value }
	}
}
