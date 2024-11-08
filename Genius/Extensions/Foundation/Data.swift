//
// Data.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension Data {

	init?(_ string: (some StringProtocol)?) {
		guard let data = string?.data(using: .utf8) else { return nil }
		self = data
	}
}
