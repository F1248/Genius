//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import SwiftUI

struct MaintenanceDataView: View {

	@State var content: CustomKeyValuePairs<LocalizedStringResource, CustomKeyValuePairs<MaintenanceCheckLabel, Symbol>>?

	let contentData: KeyValuePairs<LocalizedStringResource, KeyValuePairs<MaintenanceCheckLabel, any UISymbolRepresentable>>

	// swiftlint:disable:next type_contents_order
	init(
		content: KeyValuePairs<LocalizedStringResource, KeyValuePairs<MaintenanceCheckLabel, any UISymbolRepresentable>>,
	) {
		self.contentData = content
	}

	var body: some View {
		Group {
			if let content {
				Form {
					ForEach(content) { sectionContent in
						Section(sectionContent.key) {
							ForEach(sectionContent.value) { rowContent in
								LabeledContent {
									rowContent.value
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
			let values: [[Symbol?]] = await contentData
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
