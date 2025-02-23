//
// MaintenanceDataView.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct MaintenanceDataView: View {

	let content: [(LocalizedStringKey, [(LocalizedStringKey, String)])]

	// swiftlint:disable:next type_contents_order
	init(
		content: KeyValuePairs<LocalizedStringKey, KeyValuePairs<LocalizedStringKey, any UIRepresentable>>
	) {
		self.content =
			content.map { key, value in
				(key, value.compactMap { key, value in
					value.uiRepresentation.map { (key, $0) }
				})
			}
			.filter { !$0.1.isEmpty }
	}

	var body: some View {
		ScrollView {
			ForEach(content) { groupBoxContent in
				GroupBox {
					ForEach(enumerated: groupBoxContent.1) { index, rowContent in
						if index > 0 {
							Divider()
						}
						HStack {
							VaryingText(rowContent.0)
							Spacer()
							Text(rowContent.1)
								.foregroundColor(.secondary)
						}
						.padding(.vertical, 2)
					}
					.padding(.horizontal, 2)
				} label: {
					VaryingText(groupBoxContent.0)
						.font(.title2)
						.padding()
				}
				.frame(width: 512)
			}
			.padding()
		}
	}
}
