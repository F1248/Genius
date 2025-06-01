//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency
import AppKit
import SwiftUI
import SwiftUICore

struct SystemInformationTabView: View {

	@State var content: CustomKeyValuePairs<LocalizedStringKey, CustomKeyValuePairs<LocalizedStringKey, String>>?

	let contentData: KeyValuePairs<LocalizedStringKey, KeyValuePairs<LocalizedStringKey, any UIStringRepresentable>>

	// swiftlint:disable:next type_contents_order
	init(
		content: KeyValuePairs<LocalizedStringKey, KeyValuePairs<LocalizedStringKey, any UIStringRepresentable>>,
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
									Text(varying: rowContent.key)
									Spacer()
									Button(rowContent.value) {
										NSPasteboard.set(rowContent.value)
									}
									.buttonStyle(.borderless)
								}
								.padding(.vertical, 2)
							}
							.padding(.horizontal, 2)
						} label: {
							Text(groupBoxContent.key)
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
		.task(priority: .userInitiated) {
			let values: [[String?]] = await contentData.map { $0.value.map(\.value) }.concurrentMap { value in
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
