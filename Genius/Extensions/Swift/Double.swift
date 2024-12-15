//
// Double.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension Double {

	init?(_ int: Int?) {
		guard let int else { return nil }
		self.init(int)
	}
}
