//
// String.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import ObjectiveC

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

	init?(_ any: Any?) {
		let string: String? =
			switch any {
			case let any as Int: String(any)
			case let any as String: any
			case let any as Measurement<UnitFrequency>: MeasurementFormatter().string(from: any)
			case let any as Measurement<UnitInformationStorage>: MeasurementFormatter().string(from: any)
			case let any as BootMode:
				switch any {
				case .normal: "Normal"
				case .safe: "Safe"
				case .recovery: "Recovery"
				}
			case let any as CPUType:
				switch any {
				case .appleSilicon: "Apple Silicon"
				case .intel: "Intel"
				}
			case let any as VersionNumber: any.versions.map(String.init).joined(separator: ".")
			default: nil
			}
		guard let string else { return nil }
		self.init(string)
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
		String(
			localized: LocalizationValue(self),
			table: variesByInterfaceMode ? Settings.InterfaceMode.value.localizationTable : nil
		)
	}
}

extension String? {

	func hasPrefix(_ prefix: any StringProtocol) -> Bool {
		self?.hasPrefix(prefix) ?? false
	}
}
