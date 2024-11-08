//
// LocalizedStringKey.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUICore

extension LocalizedStringKey {

	init(_ systemInformationData: some SystemInformationDataProtocol) {
		self.init(String(systemInformationData) ?? "Unknown")
	}
}
