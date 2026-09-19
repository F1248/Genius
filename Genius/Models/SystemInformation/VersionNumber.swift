//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

struct VersionNumber: UIStringRepresentable {

	let versions: [Int]

	var uiRepresentation: String? {
		versions.map(String.init).joined(separator: ".")
	}

	init?(_ versionNumber: String) {
		guard
			let newVersions = [Int](versionNumber.split(separator: ".")),
			!newVersions.isEmpty
		else { return nil }
		self.versions = newVersions
	}
}
