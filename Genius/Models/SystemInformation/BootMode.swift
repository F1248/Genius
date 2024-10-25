//
// BootMode.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

enum BootMode {

	case normal
	case safe
	case recovery

	init?(_ bootMode: Any?) {
		if !FileManager.default.fileExists(atPath: "/System/Library/CoreServices/Finder.app") {
			self = .recovery
		} else {
			let bootMode: Self? =
				switch bootMode as? String {
				case "normal_boot": .normal
				case "safe_boot": .safe
				default: nil
				}
			guard let bootMode else { return nil }
			self = bootMode
		}
	}
}
