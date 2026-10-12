//
// © 2026 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

extension Sequence {

	func strictMap<ElementOfResult>(
		_ transform: (Element) -> ElementOfResult?,
	) -> [ElementOfResult]? {
		var result: [ElementOfResult] = []
		for element in self {
			guard let newElement = transform(element) else { return nil }
			result.append(newElement)
		}
		return result
	}

	func asyncMap<ElementOfResult>(
		_ transform: (Element) async -> ElementOfResult,
	) async -> [ElementOfResult] {
		var result: [ElementOfResult] = []
		for element in self {
			await result.append(transform(element))
		}
		return result
	}

	func concurrentMap<ElementOfResult: Sendable>(
		_ transform: @escaping @Sendable (Element) async -> ElementOfResult,
	) async -> [ElementOfResult] where Self: Sendable, Element: Sendable {
		await map { element in
			Task {
				await transform(element)
			}
		}.asyncMap { await $0.value }
	}
}
