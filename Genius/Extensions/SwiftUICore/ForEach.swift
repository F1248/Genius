//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

extension ForEach where Content == AnyView {

	init<OuterData: Sequence>(
		enumeratingID data: OuterData,
		@ViewBuilder content: @escaping (OuterData.Element) -> some View,
	) where Data == [(offset: Int, element: OuterData.Element)], ID == Int {
		self.init(
			Array(data.enumerated()),
			id: \.offset,
		) { AnyView(content($0.element)) } // Use `AnyView` to work around bug in macOS 13 causing duplicate `Section`s
	}
}
