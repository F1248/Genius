//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import SwiftUI

struct RecommendationsView: View {

	@Default(.showResolvedRecommendations)
	var showResolvedRecommendations: Bool

	var body: some View {
		VStack {
			SettingToggle(
				.showResolvedRecommendations,
				value: $showResolvedRecommendations,
				key: .showResolvedRecommendations,
				if: Defaults[.interfaceMode] >= .normal,
			)
			.toggleStyle(.switch)
			RecommendationsFormView()
		}
	}
}

#Preview {
	RecommendationsView()
		.frame(width: 712, height: 256)
}
