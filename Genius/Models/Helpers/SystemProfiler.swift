//
// SystemProfiler.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

enum SystemProfiler {

	static let available: Bool? = SystemInformation.Software.OS.bootMode.value !=? .recovery

	static let hardwareValueWrapper = AsyncValueWrapper(valueClosure: { await get("Hardware") })
	static let softwareValueWrapper = AsyncValueWrapper(valueClosure: { await get("Software") })

	static var hardware: [String: any Sendable]? { get async { await hardwareValueWrapper.value } }
	static var software: [String: any Sendable]? { get async { await softwareValueWrapper.value } }

	static func get(_ dataType: String) async -> [String: any Sendable]? {
		let dataType = "SP\(dataType)DataType" // swiftlint:disable:this explicit_type_interface
		guard let systemProfilerOutput = await Process("/usr/sbin/system_profiler", "-json", dataType)?.runSafe() else { return nil }
		return (
			JSONSerialization.jsonObject(from: systemProfilerOutput) as? [String: [[String: any Sendable]]],
		)?[dataType]?.first
	}
}
