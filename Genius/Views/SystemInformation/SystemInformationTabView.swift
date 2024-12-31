//
// SystemInformationTabView.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import SwiftUI
import SwiftUICore

struct SystemInformationTabView: View {

	let content: [(LocalizedStringKey, [(LocalizedStringKey, String)])]

	// swiftlint:disable:next type_contents_order
	init(
		content: KeyValuePairs<LocalizedStringKey, KeyValuePairs<LocalizedStringKey, any SystemInformationDataProtocol>>
	) {
		self.content =
			content.map { key, value in
				(key, value.compactMap { key, value in
					if value.applicable ?? true {
						if Defaults[.developmentMode] || Defaults[.interfaceMode] >= .advanced {
							(key, String(value) ?? "Unknown".localized)
						} else {
							String(value).map { (key, $0) }
						}
					} else {
						if Defaults[.developmentMode] {
							(key, "Not applicable".localized)
						} else {
							nil
						}
					}
				})
			}
			.filter { !$0.1.isEmpty }
	}

	var body: some View {
		ScrollView {
			ForEach(0..<content.endIndex, id: \.self) { index in
				let groupBoxContent: (LocalizedStringKey, [(LocalizedStringKey, String)]) = content[index]
				GroupBox {
					ForEach(0..<groupBoxContent.1.endIndex, id: \.self) { index in
						let rowContent: (LocalizedStringKey, String) = groupBoxContent.1[index]
						if index > 0 {
							Divider()
						}
						HStack {
							VaryingText(rowContent.0)
							Spacer()
							Button {
								Pasteboard.write(rowContent.1)
							} label: {
								Text(rowContent.1)
							}
							.buttonStyle(.borderless)
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
			.padding()
		}
	}
}
