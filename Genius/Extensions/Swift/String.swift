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

	init?(_ string: (some StringProtocol)?) {
		guard let string else { return nil }
		self.init(string)
	}

	init?(_ data: Data?) {
		guard let data else { return nil }
		self.init(decoding: data, as: UTF8.self)
	}

	init?(_ systemInformationData: some SystemInformationDataProtocol) {
		guard let string =
			switch systemInformationData.value {
			case let systemInformationData as Int: String(systemInformationData)
			case let systemInformationData as String: systemInformationData
			case let systemInformationData as Frequency: MeasurementFormatter().string(from: systemInformationData)
			case let systemInformationData as InformationStorage: MeasurementFormatter().string(from: systemInformationData)
			// swiftformat:disable indent
			case let systemInformationData as BootMode: {
				switch systemInformationData {
				case .normal: "Normal"
				case .safe: "Safe"
				case .recovery: "Recovery"
				}
			}()
				.localized()
			case let systemInformationData as CPUType: {
				switch systemInformationData {
				case .appleSilicon: "Apple Silicon"
				case .intel: "Intel"
				}
			}()
				.localized()
			case let systemInformationData as VersionNumber: systemInformationData.versions.map(String.init).joined(separator: ".")
			default: nil
			// swiftlint:disable:next statement_position
			}
		else { return nil }
		self = string
	}

	func contains(any strings: [some StringProtocol]) -> Bool {
		strings.contains { contains($0) }
	}

	func remove(_ string: some StringProtocol) -> String {
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

	func hasPrefix(_ prefix: some StringProtocol) -> Bool {
		self?.hasPrefix(prefix) ?? false
	}
}
