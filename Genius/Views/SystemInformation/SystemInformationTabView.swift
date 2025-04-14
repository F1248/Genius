//
// SystemInformationTabView.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency
import SwiftUI
import SwiftUICore

struct SystemInformationTabView: View {

	@State private var content: CustomKeyValuePairs<LocalizedStringKey, CustomKeyValuePairs<LocalizedStringKey, String>>?

	let contentData: KeyValuePairs<LocalizedStringKey, KeyValuePairs<LocalizedStringKey, any UIStringRepresentable>>

	// swiftlint:disable:next type_contents_order
	init(
		// swiftlint:disable:next opaque_over_existential
		content: KeyValuePairs<LocalizedStringKey, KeyValuePairs<LocalizedStringKey, any UIStringRepresentable>>
	) {
		self.contentData = content
	}

	var body: some View {
		ScrollView {
			if let content {
				ForEach(content) { groupBoxContent in
					GroupBox {
						ForEach(enumerated: groupBoxContent.value) { index, rowContent in
							if index > 0 {
								Divider()
							}
							HStack {
								VaryingText(rowContent.key)
								Spacer()
								Button {
									Pasteboard.write(rowContent.value)
								} label: {
									Text(rowContent.value)
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
					.frame(width: 512)
				}
				.padding()
			} else {
				ProgressView()
			}
		}
		.onAppear {
			Task(priority: .userInitiated) {
				let values: [[String?]] = await contentData.map { $0.value.map(\.value) }.concurrentMap { value in
					await value.concurrentMap { value in
						await value.uiRepresentation
					}
				}
				content = zip(contentData, values).map { keyValuePair, values in
					(key: keyValuePair.key, value: zip(keyValuePair.value, values).compactMap { keyValuePair, value in
						value.map { (key: keyValuePair.key, value: $0) }
					})
				}
				.filter { !$0.value.isEmpty }
			}
		}
	}
}
