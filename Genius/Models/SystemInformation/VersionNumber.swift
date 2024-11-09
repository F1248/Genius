//
// VersionNumber.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

struct VersionNumber {

	let versions: [Int]

	var major: Int? { versions.first }

	init?(_ versionNumber: Any?) {
		let versions = (versionNumber as? String)?.split(separator: ".")
		guard !versions.isEmpty, let versions = [Int](versions) else { return nil }
		self.versions = versions
	}
}
