//
// StringProtocol.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension StringProtocol {

	init?(_ data: Data?) {
		guard let data else { return nil }
		self.init(decoding: data, as: UTF8.self)
	}

	func contains(any strings: [some StringProtocol]) -> Bool {
		strings.contains(where: contains)
	}

	func remove(_ string: some StringProtocol) -> String {
		replacingOccurrences(of: string, with: "")
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
