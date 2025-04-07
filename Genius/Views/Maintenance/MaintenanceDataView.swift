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

	let content: CustomKeyValuePairs<LocalizedStringKey, CustomKeyValuePairs<LocalizedStringKey, Symbol>>

	// swiftlint:disable:next type_contents_order
	init(
		// swiftlint:disable:next opaque_over_existential
		content: KeyValuePairs<LocalizedStringKey, KeyValuePairs<LocalizedStringKey, any UISymbolRepresentable>>
	) {
		self.content =
			content.map { key, value in
				(key: key, value: value.compactMap { key, value in
					value.uiRepresentation.map { (key: key, value: $0) }
				})
			}
			.filter { !$0.value.isEmpty }
	}

	var body: some View {
		ScrollView {
			ForEach(content) { groupBoxContent in
				GroupBox {
					ForEach(enumerated: groupBoxContent.value) { index, rowContent in
						if index > 0 {
							Divider()
						}
						HStack {
							VaryingText(rowContent.key)
							Spacer()
							rowContent.value.image
								.frame(width: 14)
						}
						.padding(.vertical, 2)
					}
					.padding(.horizontal, 2)
				} label: {
					VaryingText(groupBoxContent.key)
						.font(.title2)
						.padding()
				}
				.frame(width: 512)
			}
			.padding()
		}
	}
}
