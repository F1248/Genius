//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import SFSafeSymbols
import SwiftUI

struct AppCommands: Commands {

	@Default(.interfaceMode)
	var interfaceMode: Settings.InterfaceMode

	@ObservedObject var observedSharedData: SharedData = .sharedData

	var body: some Commands {
		CommandGroup(replacing: .appSettings) {
			Button {
				SharedData.sharedData.showUninstallationAlert = true
			} label: {
				Label {
					Text(varying: "Uninstall Genius…")
				} icon: {
					Image(systemSymbol: .trash)
				}
			}
			Divider()
			TabButton(tab: ContentViewTab.settings)
		}
		CommandGroup(replacing: .newItem) { EmptyView() }
		CommandGroup(before: .toolbar) {
			TabViewButtons<ContentViewTab>()
				.id(interfaceMode)
			switch observedSharedData.selectedTabsIndices[ContentViewTab.id] {
				case ContentViewTab.systemInformation.index: TabViewButtons<SystemInformationViewTab>()
				default: EmptyView()
			}
		}
		CommandGroup(replacing: .help) { EmptyView() }
	}
}
