//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import SwiftUI

struct FormView<Label: View, Value: FormValue>: View {

	@State var content: CustomKeyValuePairs<LocalizedStringResource, CustomKeyValuePairs<Label, Value>>?

	let contentData: KeyValuePairs<LocalizedStringResource, KeyValuePairs<Label, any SystemInformationProtocol<Value>>>

	// swiftlint:disable:next type_contents_order
	init(
		content: KeyValuePairs<LocalizedStringResource, KeyValuePairs<Label, any SystemInformationProtocol<Value>>>,
	) {
		self.contentData = content
	}

	var body: some View {
		Group {
			if let content {
				Form {
					ForEach(enumeratingID: content) { sectionContent in
						Section(sectionContent.key) {
							ForEach(enumeratingID: sectionContent.value) { rowContent in
								LabeledContent {
									rowContent.value.formView
								} label: {
									rowContent.key
								}
							}
						}
					}
				}
				.formStyle(.grouped)
				.frame(width: 512)
			} else {
				ProgressView()
			}
		}
		.task {
			let values: [[Value?]] = await contentData
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
