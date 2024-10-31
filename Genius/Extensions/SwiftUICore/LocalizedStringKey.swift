//
// LocalizedStringKey.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUICore

extension LocalizedStringKey {

	init(_ any: any SystemInformationDataProtocol) {
		self.init(String(any) ?? "Unknown")
	}
}
