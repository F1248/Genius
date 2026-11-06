//
// © 2026 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

struct GDMF: Decodable {

	// swiftlint:disable identifier_name
	struct Asset: Decodable {

		struct Version: Decodable {

			let ProductVersion: VersionNumber
		}

		let macOS: [Version]
	}

	let PublicAssetSets: Asset

	// swiftlint:enable identifier_name

	init?() async {
		guard
			let newGDMF: Self = await Network.data(from: "https://gdmf.apple.com/v2/pmv")
				.flatMap({ try? JSONDecoder().decode(Self.self, from: $0) })
		else { return nil }
		self = newGDMF
	}
}
