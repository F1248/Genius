//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

struct VersionNumber: UIStringRepresentable, Decodable {

	let versions: [Int]

	var major: Int? { versions.first }

	var uiRepresentation: String? {
		versions.map(String.init).joined(separator: ".")
	}

	init?(_ versionNumber: any StringProtocol) {
		guard
			let newVersions = versionNumber.split(separator: ".").strictMap({ Int($0) }),
			!newVersions.isEmpty
		else { return nil }
		self.versions = newVersions
	}

	init(from decoder: any Decoder) throws {
		let container = try decoder.singleValueContainer()
		guard let newSelf = try Self(container.decode(String.self)) else {
			throw DecodingError.dataCorruptedError(in: container, debugDescription: "")
		}
		self = newSelf
	}
}
