//
// String.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension String {

	init?(_ string: (any StringProtocol)?) {
		guard let string else { return nil }
		self.init(string)
	}

	init?(_ data: Data?) {
		guard let data else { return nil }
		self.init(decoding: data, as: UTF8.self)
	}

	init?(_ versionNumber: VersionNumber?) {
		self.init(versionNumber?.versions.map(String.init).joined(separator: "."))
	}

	func contains(any strings: [any StringProtocol]) -> Bool {
		strings.contains { contains($0) }
	}

	func remove(_ string: any StringProtocol) -> String {
		replacingOccurrences(of: string, with: "")
	}

	func between(start: String, end: String) -> String? {
		guard
			let startIndex = range(of: start)?.upperBound,
			let endIndex = range(of: end, range: startIndex..<endIndex)?.lowerBound
		else { return nil }
		return String(self[startIndex..<endIndex])
	}

	func localized(variesByInterfaceMode: Bool = false) -> String {
		let tableName: String? = variesByInterfaceMode ? Settings.InterfaceMode.value.localizationTable : nil
		return if #available(macOS 12, *) {
			String(localized: LocalizationValue(self), table: tableName)
		} else {
			NSLocalizedString(self, tableName: tableName, comment: "")
		}
	}
}

extension String? {

	func hasPrefix(_ prefix: any StringProtocol) -> Bool {
		self?.hasPrefix(prefix) ?? false
	}
}
