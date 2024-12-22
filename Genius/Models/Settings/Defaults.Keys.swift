//
// Defaults.Keys.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults

extension Defaults.Keys {

	static let interfaceMode = Key<Settings.InterfaceMode>("InterfaceMode", default: .normal)
	static let developmentMode = Key<Bool>("DevelopmentMode", default: false)
}
