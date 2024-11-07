//
// SystemInformationTabView.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct SystemInformationTabView: View {

	let content: [(LocalizedStringKey, [(LocalizedStringKey, String)])]
	let label: Label<Text, Image>

	// swiftlint:disable:next type_contents_order
	init(
		content: () -> KeyValuePairs<LocalizedStringKey, KeyValuePairs<LocalizedStringKey, any SystemInformationDataProtocol>>,
		label: () -> Label<Text, Image>
	) {
		self.content =
			content().map { key, value in
				(key, value.compactMap { key, value in
					if !value.applicable {
						nil
					} else if Settings.DevelopmentMode.value || Settings.InterfaceMode.value >= .advanced {
						(key, String(value) ?? "Unknown".localized())
					} else {
						String(value).map { (key, $0) }
					}
				})
			}
			.filter { !$0.1.isEmpty }
		self.label = label()
	}

	var body: some View {
		ScrollView {
			label
				.font(.title)
				.padding()
			ForEach(0..<content.endIndex, id: \.self) { index in
				let groupBoxContent: (LocalizedStringKey, [(LocalizedStringKey, String)]) = content[index]
				GroupBox {
					ForEach(0..<groupBoxContent.1.endIndex, id: \.self) { index in
						let rowContent: (LocalizedStringKey, String) = groupBoxContent.1[index]
						if index > 0 {
							Divider()
						}
						HStack {
							Text(rowContent.0)
							Spacer()
							Button {
								Pasteboard.write(rowContent.1)
							} label: {
								Text(rowContent.1)
							}
							.buttonStyle(.plain)
						}
						.padding(.vertical, 2)
					}
					.padding(.horizontal, 2)
				} label: {
					Text(groupBoxContent.0)
						.font(.title2)
						.padding()
				}
				.frame(width: 512)
			}
			.padding(.bottom)
		}
	}
}
