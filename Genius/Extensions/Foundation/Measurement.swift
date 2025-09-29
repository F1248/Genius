//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import ObjectiveC

typealias Frequency = Measurement<UnitFrequency>
typealias InformationStorage = Measurement<UnitInformationStorage>

extension Measurement: UIStringRepresentable {

	var uiRepresentation: String? {
		switch self {
			case let self as Frequency:
				let units: [UnitFrequency] =
					[.terahertz, .gigahertz, .megahertz, .kilohertz, .hertz, .millihertz, .microhertz, .nanohertz]
				return MeasurementFormatter().string(
					from: { () -> Measurement<UnitFrequency> in
						if value.isZero { return self.converted(to: .baseUnit()) }
						let convertedMeasurements = units.lazy.map(self.converted)
						return convertedMeasurements.first { $0.value >= 1 } ?? convertedMeasurements.last
							.safeForceUnwrapped(fallback: self)
					}(),
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
		self.init(value: Double(value), unit: .baseUnit())
	}
}
