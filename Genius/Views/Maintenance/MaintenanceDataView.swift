//
// MaintenanceDataView.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency
import SwiftUI
import SwiftUICore

struct MaintenanceDataView: View {

	@State var content: CustomKeyValuePairs<LocalizedStringKey, CustomKeyValuePairs<MaintenanceCheckLabel, Symbol>>?

	let contentData: KeyValuePairs<LocalizedStringKey, KeyValuePairs<MaintenanceCheckLabel, any UISymbolRepresentable>>

	// swiftlint:disable:next type_contents_order
	init(
		content: KeyValuePairs<LocalizedStringKey, KeyValuePairs<MaintenanceCheckLabel, any UISymbolRepresentable>>,
	) {
		self.contentData = content
	}

	var body: some View {
		ScrollView {
			Group {
				if let content {
					ForEach(content) { groupBoxContent in
						GroupBox {
							ForEach(enumerated: groupBoxContent.value) { index, rowContent in
								if index > 0 {
									Divider()
								}
								HStack {
									rowContent.key
									Spacer()
									rowContent.value
								}
								.padding(.vertical, 2)
							}
							.padding(.horizontal, 2)
						} label: {
							VaryingText(groupBoxContent.key)
								.font(.title2)
								.padding()
						}
						.frame(maxWidth: 512)
					}
				} else {
					ProgressView()
				}
			}
			.padding()
		}
		.onAppear {
			Task(priority: .userInitiated) {
				let values: [[Symbol?]] = await contentData.map { $0.value.map(\.value) }.concurrentMap { value in
					await value.concurrentMap { value in
						await value.uiRepresentation
					}
				}
				content = zip(contentData, values)
					.map { keyValuePair, values in
						(key: keyValuePair.key, value: zip(keyValuePair.value, values).compactMap { keyValuePair, value in
							value.map { (key: keyValuePair.key, value: $0) }
						})
					}
					.filter { !$0.value.isEmpty }
			}
		}
	}
}
