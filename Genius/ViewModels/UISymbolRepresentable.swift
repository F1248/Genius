//
// UISymbolRepresentable.swift
// Genius
//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency

protocol UISymbolRepresentable: Sendable {

	@MainActor var uiRepresentation: Symbol? { get async }
}
