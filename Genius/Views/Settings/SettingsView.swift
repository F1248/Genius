//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import SwiftUI

struct SettingsView: View {

	@Default(.useTextInsteadOfSymbols)
	var useTextInsteadOfSymbols: Bool
	@Default(.interfaceMode)
	var interfaceMode: Settings.InterfaceMode

	@Default(.developmentMode)
	var developmentMode: Bool

	var body: some View {
		ScrollView {
			Group {
				GroupBox {
					VStack(alignment: .leading) {
						SpacedToggle(.useTextInsteadOfSymbols, isOn: $useTextInsteadOfSymbols)
							.padding(.vertical, 2)
						Divider()
						VStack(alignment: .leading) {
							Text(.interfaceMode)
							Picker(selection: $interfaceMode) {
								ForEach(Settings.InterfaceMode.allCases) { interfaceMode in
									Text(interfaceMode.title)
								}
							}
							.pickerStyle(.inline)
							.labelsHidden()
						}
						.padding(.vertical, 2)
					}
					.padding(.horizontal, 2)
					.frame(width: 512, alignment: .leading)
				} label: {
					Text(.interface)
						.font(.title2)
						.padding()
				}
				if developmentMode || interfaceMode >= .powerUser {
					GroupBox {
						VStack(alignment: .leading) {
							SpacedToggle(.developmentMode, isOn: $developmentMode)
								.padding(.vertical, 2)
						}
						.padding(.horizontal, 2)
						.frame(width: 512, alignment: .leading)
					} label: {
						Text(.development)
							.font(.title2)
							.padding()
					}
				}
			}
			.padding()
		}
	}
}

#Preview {
	SettingsView()
		.frame(width: 686, height: 256)
}
