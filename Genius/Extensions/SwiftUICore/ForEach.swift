//
// ForEach.swift
// Genius
//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUICore

extension ForEach where Content: View {

	init<OuterData: Sequence>(
		_ data: OuterData,
		@ViewBuilder content: @escaping (OuterData.Element) -> Content,
	) where Data == [(offset: Int, element: OuterData.Element)], ID == Int {
		self.init(
			Array(data.enumerated()),
			id: \.offset,
		) { content($0.element) }
	}

	init<OuterData: Sequence>(
		enumerated data: OuterData,
		@ViewBuilder content: @escaping (Int, OuterData.Element) -> Content,
	) where Data == [(offset: Int, element: OuterData.Element)], ID == Int {
		self.init(
			Array(data.enumerated()),
			id: \.offset,
		) { content($0.offset, $0.element) }
	}
}
