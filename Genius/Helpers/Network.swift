//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

enum Network {

	static func data(from urlString: String) async -> Data? {
		guard
			let url = URL(string: urlString),
			let (data, response) = try? await URLSession.shared.data(from: url),
			(response as? HTTPURLResponse)?.statusCode == 200
		else { return nil }
		return data
	}

	static func string(from urlString: String) async -> String? {
		guard let data = await data(from: urlString) else { return nil }
		return String(data: data)
	}
}
