//
// © 2026 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import SwiftUI

struct DevelopmentSection: View {

	@Default(.developmentMode)
	var developmentMode: Bool

	var body: some View {
		if !Defaults.Keys.developmentMode.isDefaultValue || Defaults[.interfaceMode] >= .powerUser {
			Section(.development) {
				SettingToggle(.developmentMode, value: $developmentMode, key: .developmentMode)
			}
		}
	}
}
