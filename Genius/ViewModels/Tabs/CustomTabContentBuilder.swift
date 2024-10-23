//
// CustomTabContentBuilder.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@resultBuilder
enum CustomTabContentBuilder {

	static func buildBlock(_ tabs: [CustomTab]) -> [CustomTab] {
		tabs
	}

	static func buildBlock(_ tabs: CustomTab...) -> [CustomTab] {
		tabs
	}
}
