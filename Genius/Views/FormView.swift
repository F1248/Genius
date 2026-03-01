//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import SwiftUI

struct FormView<ValueLabel: View, Value: FormValue>: View {

	@State var content: CustomKeyValuePairs<LocalizedStringResource, CustomKeyValuePairs<ValueLabel, Value??>>

	let textWhenEmpty: LocalizedStringResource
	let contentData: KeyValuePairs<LocalizedStringResource, KeyValuePairs<ValueLabel, any SystemInformationProtocol<Value>>>

	// swiftlint:disable:next type_contents_order
	init(
		textWhenEmpty: LocalizedStringResource,
		content: KeyValuePairs<LocalizedStringResource, KeyValuePairs<ValueLabel, any SystemInformationProtocol<Value>>>,
	) {
		self.textWhenEmpty = textWhenEmpty
		self.contentData = content
		self.content = content
			.map { key, value in
				(key: key, value: value.map { key, value in
					(key: key, value: value.syncUIRepresentation)
				})
			}
	}

	var body: some View {
		Group {
			if content.contains(where: { $0.value.contains(where: { $0.value != nil }) }) {
				Form {
					ForEach(enumeratingID: content) { sectionTitle, sectionEntries in
						if sectionEntries.contains(where: { $0.value != nil }) {
							Section(sectionTitle) {
								ForEach(enumeratingID: sectionEntries) { valueLabel, value in
									if let value {
										LabeledContent {
											if let value {
												value.formView
											} else {
												ProgressView()
													.controlSize(.small)
											}
										} label: {
											valueLabel
										}
									}
								}
							}
						}
					}
				}
				.formStyle(.grouped)
				// prevent background being visible with Liquid Glass disabled on macOS 26 and later
				.scrollContentBackground(.hidden)
				.frame(width: 512)
			} else {
				Text(textWhenEmpty)
					.padding()
			}
		}
		.task {
			for sectionIndex in content.indices {
				for entryIndex in content[sectionIndex].value.indices {
					guard case .some(nil) = content[sectionIndex].value[entryIndex].value else { continue }
					Task {
						content[sectionIndex].value[entryIndex].value =
							await contentData[sectionIndex].value[entryIndex].value.uiRepresentation.map(\.self)
					}
				}
			}
		}
	}
}
