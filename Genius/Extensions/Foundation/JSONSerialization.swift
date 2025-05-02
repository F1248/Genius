//
// JSONSerialization.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension JSONSerialization {

	class func jsonObject(from string: String?) -> Any? {
		try? Data(string).map { try jsonObject(with: $0) }
	}
}
