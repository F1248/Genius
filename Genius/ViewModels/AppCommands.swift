//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import SFSafeSymbols
import Sparkle
import SwiftUI

struct AppCommands: Commands {

	@Default(.interfaceMode)
	var interfaceMode: Settings.InterfaceMode

	@ObservedObject var observedSharedData: SharedData = .sharedData

	var body: some Commands {
		CommandGroup(after: .appInfo) {
			Divider()
			Button(
				.checkForUpdatesEllipsis,
				systemImage: SFSymbol.arrowTriangle2Circlepath.rawValue,
			) {
				guard updater.canCheckForUpdates else {
					SharedData.sharedData.showUpdateInProgressAlert = true
					return
				}
				updater.checkForUpdates()
			}
			Button(.uninstallAppEllipsis, systemImage: SFSymbol.trash.rawValue) {
				SharedData.sharedData.showUninstallationDialog = true
			}
		}
		CommandGroup(replacing: .appSettings) {
			TabButton(tab: ContentViewTab.settings)
		}
		CommandGroup(replacing: .newItem) {}
		CommandGroup(before: .toolbar) {
			TabViewButtons<ContentViewTab>()
				.id(interfaceMode)
			switch observedSharedData.selectedTabsIndices[ContentViewTab.id] {
				case ContentViewTab.systemInformation.index: TabViewButtons<SystemInformationViewTab>()
				default: EmptyView()
			}
		}
		CommandGroup(replacing: .help) {}
	}
}
