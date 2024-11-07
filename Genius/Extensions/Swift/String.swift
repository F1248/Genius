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

	init?(_ any: any SystemInformationDataProtocol) {
		guard let string =
			switch any.value {
			case let any as Int: String(any)
			case let any as String: any
			case let any as Frequency: MeasurementFormatter().string(from: any)
			case let any as InformationStorage: MeasurementFormatter().string(from: any)
			// swiftformat:disable indent
			case let any as BootMode: {
				switch any {
				case .normal: "Normal"
				case .safe: "Safe"
				case .recovery: "Recovery"
				}
			}()
				.localized()
			case let any as CPUType: {
				switch any {
				case .appleSilicon: "Apple Silicon"
				case .intel: "Intel"
				}
			}()
				.localized()
			case let any as VersionNumber: any.versions.map(String.init).joined(separator: ".")
			default: nil
			// swiftlint:disable:next statement_position
			}
		else { return nil }
		self = string
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
