//
// UIStringRepresentable.swift
// Genius
//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

protocol UIStringRepresentable: Sendable {

	var uiRepresentation: String? { get async }
}
