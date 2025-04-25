//
// UserDefaults.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension UserDefaults {

	static func read<Wrapped>(_ domain: String, _ key: String) -> Wrapped? {
		UserDefaults(suiteName: domain)?.object(forKey: key) as? Wrapped
	}
}
