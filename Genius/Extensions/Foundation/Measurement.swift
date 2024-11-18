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
		if let self = self as? InformationStorage {
			let formatter = ByteCountFormatter()
			formatter.countStyle = .binary
			return formatter.string(from: self)
		}
		let formatter = MeasurementFormatter()
		formatter.unitOptions = .naturalScale
		return formatter.string(from: self)
	}
}

extension Measurement where UnitType: Dimension {

	init(value: Double) {
		self.init(value: value, unit: UnitType.baseUnit())
	}
}
