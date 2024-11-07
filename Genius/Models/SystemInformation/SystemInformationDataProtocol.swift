//
// SystemInformationDataProtocol.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

protocol SystemInformationDataProtocol {

	associatedtype T

	var value: T { get }
	var applicable: Bool { get }
}
