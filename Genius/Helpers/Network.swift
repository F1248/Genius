//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

enum Network {

	static func string(from url: String) async -> String? {
		guard
			let url = URL(string: url),
			let (data, response) = try? await URLSession.shared.data(from: url),
			(response as? HTTPURLResponse)?.statusCode == 200
		else { return nil }
		return String(data)
	}
}
