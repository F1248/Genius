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

	static let hardware = get("Hardware")
	static let software = get("Software")

	static func get(_ dataType: String) -> [String: any Sendable]? {
		let dataType = "SP\(dataType)DataType" // swiftlint:disable:this explicit_type_interface
		return (
			JSONSerialization.jsonOptionalObject(
				with: Data(Process("/usr/sbin/system_profiler", "-json", dataType)?.runSafe())
			) as? [String: [[String: any Sendable]]]
		)?[dataType]?.first
	}
}
