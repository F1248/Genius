//
// Defaults.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

enum Defaults {

	static func read<W>(_ domain: String, _ key: String) -> W? {
		UserDefaults(suiteName: domain)?.object(forKey: key) as? W
	}
}
