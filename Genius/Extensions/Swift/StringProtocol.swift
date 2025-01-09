//
// StringProtocol.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension StringProtocol {

	init(_ data: Data) {
		self.init(decoding: data, as: UTF8.self)
	}

	init?(_ data: Data?) {
		guard let data else { return nil }
		self.init(data)
	}

	func contains(anyWholeWord strings: String...) -> Bool {
		strings.contains { contains(wholeWord: $0) }
	}

	func contains(wholeWord: String) -> Bool {
		components(separatedBy: .alphanumerics.inverted).contains(wholeWord)
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
