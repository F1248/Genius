//
// UserDefaults.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension UserDefaults {

	static func read<Wrapped>(_ suiteName: String, _ key: String, default defaultValue: Wrapped) -> Wrapped? {
		guard let userDefaults = UserDefaults(suiteName: suiteName) else { return nil }
		return userDefaults.object(forKey: key) as? Wrapped ?? defaultValue
	}
}
