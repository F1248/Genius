//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import AppKit
import Foundation
import SwiftUI

struct SystemInformationTabView: View {

	@State var content: CustomKeyValuePairs<LocalizedStringResource, CustomKeyValuePairs<LocalizedStringResource, String>>?

	let contentData: KeyValuePairs<LocalizedStringResource, KeyValuePairs<LocalizedStringResource, any UIStringRepresentable>>

	// swiftlint:disable:next type_contents_order
	init(
		content: KeyValuePairs<LocalizedStringResource, KeyValuePairs<LocalizedStringResource, any UIStringRepresentable>>,
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
									Text(rowContent.key)
									Spacer()
									Button(rowContent.value) {
										NSPasteboard.set(rowContent.value)
									}
									.buttonStyle(.borderless)
								}
								.padding(.vertical, 2)
							}
							.padding(.horizontal, 2)
							.frame(width: 512, alignment: .leading)
						} label: {
							Text(groupBoxContent.key)
								.font(.title2)
								.padding()
						}
					}
				} else {
					ProgressView()
				}
			}
			.padding()
		}
		.task {
			let values: [[String?]] = await contentData
				.map { $0.value.map(\.value) }
				.concurrentMap { await $0.concurrentMap { await $0.uiRepresentation } }
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
