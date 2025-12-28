//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import SwiftUI

struct FormView<ValueLabel: View, Value: FormValue>: View {

	@State var content: CustomKeyValuePairs<LocalizedStringResource, CustomKeyValuePairs<ValueLabel, Value>>?

	let contentData: KeyValuePairs<LocalizedStringResource, KeyValuePairs<ValueLabel, any SystemInformationProtocol<Value>>>

	// swiftlint:disable:next type_contents_order
	init(
		content: KeyValuePairs<LocalizedStringResource, KeyValuePairs<ValueLabel, any SystemInformationProtocol<Value>>>,
	) {
		self.contentData = content
	}

	var body: some View {
		Group {
			if let content {
				Form {
					ForEach(enumeratingID: content) { sectionTitle, sectionValues in
						Section(sectionTitle) {
							ForEach(enumeratingID: sectionValues) { valueLabel, value in
								LabeledContent {
									value.formView
								} label: {
									valueLabel
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
