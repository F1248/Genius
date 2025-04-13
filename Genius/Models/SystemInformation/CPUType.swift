//
// CPUType.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

enum CPUType: UIStringRepresentable {

	case appleSilicon
	case intel

	var uiRepresentation: String? {
		{
			switch self {
				case .appleSilicon: "Apple Silicon"
				case .intel: "Intel"
			}
		}()
			.localized
	}
}
