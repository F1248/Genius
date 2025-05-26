//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct AppCommands: Commands {

	@ObservedObject var observedSharedData: SharedData = sharedData

	var body: some Commands {
		CommandGroup(replacing: .appSettings) {
			Button {
				sharedData.showUninstallAlert = true
			} label: {
				VaryingText("Uninstall Genius…")
			}
			Divider()
			TabButton(tab: ContentViewTab.settings)
		}
		CommandGroup(replacing: .newItem) { EmptyView() }
		CommandGroup(before: .toolbar) {
			TabViewButtons<ContentViewTab>()
			switch observedSharedData.selectedTabsIndices[ContentViewTab.id] {
				case ContentViewTab.systemInformation.index: TabViewButtons<SystemInformationViewTab>()
				default: EmptyView()
			}
		}
		CommandGroup(replacing: .help) { EmptyView() }
	}
}
