//
// BootMode.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

enum BootMode: UIRepresentable {

	case normal
	case safe
	case recovery

	var uiRepresentation: String? {
		{
			switch self {
				case .normal: "Normal"
				case .safe: "Safe"
				case .recovery: "Recovery"
			}
		}()
			.localized
	}
}
