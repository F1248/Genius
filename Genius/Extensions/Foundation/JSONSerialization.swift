//
// JSONSerialization.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension JSONSerialization {

	class func jsonOptionalObject(with data: Data?, options opt: ReadingOptions = []) -> Any? {
		try? data.map { try jsonObject(with: $0, options: opt) }
	}
}
