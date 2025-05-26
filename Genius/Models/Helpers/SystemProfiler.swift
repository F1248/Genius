//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

struct SystemProfiler {

	static let available: Bool? = SystemInformation.Software.OS.bootMode.value !=? .recovery

	static let hardwareInstance = Self(dataType: "Hardware")
	static let softwareInstance = Self(dataType: "Software")

	static var hardware: [String: any Sendable]? { get async { await hardwareInstance.valueWrapper.value } }
	static var software: [String: any Sendable]? { get async { await softwareInstance.valueWrapper.value } }

	let valueWrapper: AsyncValueWrapper<[String: any Sendable]?>

	init(dataType: String) {
		self.valueWrapper = AsyncValueWrapper(valueClosure: {
			let dataType = "SP\(dataType)DataType" // swiftlint:disable:this explicit_type_interface
			guard
				let systemProfilerOutput = await Process("/usr/sbin/system_profiler", "-json", dataType)?.runSafe()
			else { return nil }
			return (
				JSONSerialization.jsonObject(from: systemProfilerOutput) as? [String: [[String: any Sendable]]],
			)?[dataType]?.first
		})
	}
}
