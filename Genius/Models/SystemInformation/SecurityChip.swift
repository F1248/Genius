//
// SecurityChip.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

enum SecurityChip: Comparable, UIStringRepresentable {

	case none
	case t1
	case t2
	case mSeries

	var uiRepresentation: String? {
		{
			switch self {
				case .none: "None (Security Chip)"
				case .t1: "Apple T1"
				case .t2: "Apple T2"
				case .mSeries: "M-series"
			}
		}()
			.localized
	}
}
