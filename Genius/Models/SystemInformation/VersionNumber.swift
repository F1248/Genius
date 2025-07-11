//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

struct VersionNumber: UIStringRepresentable {

	let versions: [Int]

	nonisolated var uiRepresentation: String? {
		versions.map(String.init).joined(separator: ".")
	}

	init?(_ versionNumber: String) {
		let versions = versionNumber.split(separator: ".")
		guard let versions = [Int](versions), !versions.isEmpty else { return nil }
		self.versions = versions
	}
}
