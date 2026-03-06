//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import SwiftUI

struct MaintenanceView: View {

	@Default(.showPassedMaintenanceChecks)
	var showPassedChecks: Bool

	var body: some View {
		VStack {
			SettingToggle(
				.showPassedChecks,
				value: $showPassedChecks,
				key: .showPassedMaintenanceChecks,
				if: Defaults[.interfaceMode] >= .normal,
			)
			.toggleStyle(.switch)
			MaintenanceFormView()
		}
	}
}

#Preview {
	MaintenanceView()
		.frame(width: 712, height: 256)
}
