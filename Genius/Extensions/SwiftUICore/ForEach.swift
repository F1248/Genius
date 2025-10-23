//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

extension ForEach where Content: View {

	init<OuterData: Sequence>(
		_ data: OuterData,
		@ViewBuilder content: @escaping (OuterData.Element) -> Content,
	) where Data == [(offset: Int, element: OuterData.Element)], ID == Int {
		self.init(
			Array(data.enumerated()),
			id: \.offset,
		) { content($0.element) }
	}
}
