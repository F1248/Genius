//
// Measurement.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import ObjectiveC

typealias Frequency = Measurement<UnitFrequency>
typealias InformationStorage = Measurement<UnitInformationStorage>

extension Measurement: MeasurementProtocol {

	func formatted() -> String {
		switch self {
		case let self as Frequency:
			let formatter = MeasurementFormatter()
			let units: [UnitFrequency] = [.terahertz, .gigahertz, .megahertz, .kilohertz, .hertz, .millihertz, .microhertz, .nanohertz]
			return formatter.string(
				from: units.lazy.map(self.converted).first { $0.value >= 1 } ?? self.converted(to: UnitFrequency.baseUnit())
			)
		case let self as InformationStorage:
			let formatter = ByteCountFormatter()
			formatter.countStyle = .binary
			return formatter.string(from: self)
		default:
			let formatter = MeasurementFormatter()
			formatter.unitOptions = .naturalScale
			return formatter.string(from: self)
		}
	}
}

extension Measurement where UnitType: Dimension {

	init(value: Int) {
		self.init(value: Double(value), unit: UnitType.baseUnit())
	}
}
