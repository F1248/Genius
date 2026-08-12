//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
@testable import Genius
import Testing

extension RecommendationTests {

	struct uiRepresentation {

		@Test
		@MainActor
		func Unavailable() {
			Defaults[.developmentMode] = false
			#expect(Recommendation<Bool?, _>(nil, available: false).uiRepresentation == nil)

			Defaults[.developmentMode] = true
			#expect(Recommendation<Bool?, _>(nil, available: false).uiRepresentation == .unavailable)
		}

		@Test
		@MainActor
		func Pending() {
			#expect(Recommendation<Bool?, _>(false, available: true).uiRepresentation == .pending)
		}

		@Test
		@MainActor
		func Resolved() {
			Defaults[.showResolvedRecommendations] = false
			#expect(Recommendation<Bool?, _>(true, available: true).uiRepresentation == nil)

			Defaults[.showResolvedRecommendations] = true
			#expect(Recommendation<Bool?, _>(true, available: true).uiRepresentation == .resolved)
		}

		@Test
		@MainActor
		func Unknown() {
			Defaults[.developmentMode] = false
			Defaults[.interfaceMode] = .normal
			#expect(Recommendation<Bool?, _>(nil, available: true).uiRepresentation == nil)

			Defaults[.developmentMode] = false
			Defaults[.interfaceMode] = .advanced
			#expect(Recommendation<Bool?, _>(nil, available: true).uiRepresentation == .unknown)

			Defaults[.developmentMode] = true
			Defaults[.interfaceMode] = .normal
			#expect(Recommendation<Bool?, _>(nil, available: true).uiRepresentation == .unknown)
		}
	}
}
