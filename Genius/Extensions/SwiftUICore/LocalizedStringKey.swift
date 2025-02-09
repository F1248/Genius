//
// LocalizedStringKey.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUICore

extension LocalizedStringKey {

	var key: String {
		(Mirror(reflecting: self).children.first { $0.label == "key" }?.value as? String).safeForceUnwrapped()
	}
}
