//
// Setting.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

protocol Setting {}

extension Setting {

	static var key: String { String(describing: self) }
}
