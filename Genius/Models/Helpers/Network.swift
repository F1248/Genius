//
// Network.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

enum Network {

	static func transferURL(_ url: String) -> String? {
		Process("/usr/bin/curl", ["--silent", "--show-error", url])?.runSafe()
	}
}
