//
// Network.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

enum Network {

	static func string(from url: String) -> String? {
		Process("/usr/bin/curl", "--no-progress-meter", url)?.runSafe()
	}
}
