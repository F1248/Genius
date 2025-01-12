//
// StringProtocol.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension StringProtocol {

	var firstLine: SubSequence? {
		split(separator: "\n", maxSplits: 1).first
	}

	init(_ data: Data) {
		self.init(decoding: data, as: UTF8.self)
	}

	init?(_ data: Data?) {
		guard let data else { return nil }
		self.init(data)
	}

	func remove(_ string: some StringProtocol) -> String {
		replacingOccurrences(of: string, with: "")
	}

	func betweenAnchored(start: some StringProtocol, end: (some StringProtocol)? = nil as String?) -> SubSequence? {
		guard
			let startIndex = range(of: start, options: .anchored)?.upperBound,
			let endIndex = end.map({ range(of: $0, options: [.anchored, .backwards])?.lowerBound }) ?? endIndex
		else { return nil }
		return self[startIndex..<endIndex]
	}

	func between(start: some StringProtocol, end: some StringProtocol) -> SubSequence? {
		guard
			let startIndex = range(of: start)?.upperBound,
			let endIndex = range(of: end, range: startIndex..<endIndex)?.lowerBound
		else { return nil }
		return self[startIndex..<endIndex]
	}
}

extension Optional where Wrapped: StringProtocol {

	func hasPrefix(_ prefix: some StringProtocol) -> Bool {
		self?.hasPrefix(prefix) ?? false
	}
}
