//
// String.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import Foundation

extension String: DataInitializable {

	init?(_ string: (some StringProtocol)?) {
		guard let string else { return nil }
		self.init(string)
	}

	init?(_ systemInformationData: some SystemInformationDataProtocol) {
		guard let string =
			switch systemInformationData.value {
			case let systemInformationData as Int: String(systemInformationData)
			case let systemInformationData as String: systemInformationData
			case let systemInformationData as any MeasurementProtocol: systemInformationData.formatted()
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
			case let systemInformationData as SecurityChip: {
				switch systemInformationData {
				case .mSeries: "M-series"
				case .t2: "Apple T2"
				case .t1: "Apple T1"
				case .none: "None (Security Chip)"
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

	func localized(variesByInterfaceMode: Bool = false) -> String {
		let tableName: String? = variesByInterfaceMode ? Defaults[.interfaceMode].localizationTable : nil
		return if #available(macOS 12, *) {
			String(localized: LocalizationValue(self), table: tableName)
		} else {
			NSLocalizedString(self, tableName: tableName, comment: "")
		}
	}
}
