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

	@ObservedObject var observedSharedData: SharedData = .shared

	var body: some Commands {
		CommandGroup(after: .appInfo) {
			Divider()
			Button(
				.checkForUpdatesEllipsis,
				systemImage: SFSymbol.arrowTriangle2Circlepath.rawValue,
			) {
				guard updater.canCheckForUpdates else {
					SharedData.shared.showUpdateInProgressAlert = true
					return
				}
				updater.checkForUpdates()
			}
			Button(.uninstallAppEllipsis, systemImage: SFSymbol.trash.rawValue) {
				SharedData.shared.showUninstallationDialog = true
			}
		}
		CommandGroup(replacing: .appSettings) {
			TabCommand(tab: ContentViewTab.settings)
		}
		CommandGroup(replacing: .newItem) {}
		CommandGroup(before: .toolbar) {
			TabViewCommands<ContentViewTab>()
				.id(interfaceMode)
			switch observedSharedData.selectedTabsIndices[ContentViewTab.id] {
				case ContentViewTab.systemInformation.index: TabViewCommands<SystemInformationViewTab>()
				default: EmptyView()
			}
		}
		CommandGroup(replacing: .help) {}
	}
}
