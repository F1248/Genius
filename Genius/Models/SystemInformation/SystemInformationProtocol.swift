//
// SystemInformationProtocol.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

protocol SystemInformationProtocol {

	associatedtype Value

	var value: Value { get }
	var applicable: Bool? { get }
}
