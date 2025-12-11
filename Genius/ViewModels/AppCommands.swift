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
			if (SystemInformation.Software.OS.bootMode.value !=? .recovery) ?? true {
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
			}
			Button(.uninstallAppEllipsis, systemImage: SFSymbol.trash.rawValue) {
				SharedData.shared.showUninstallationDialog = true
			}
		}
		CommandGroup(replacing: .appSettings) {
			ContentViewTab.settings.command
		}
		CommandGroup(replacing: .newItem) {}
		CommandGroup(before: .toolbar) {
			ContentViewTab.commands
				.id(interfaceMode)
			switch observedSharedData.selectedTabsIndices[ContentViewTab.id] {
				case ContentViewTab.systemInformation.index: SystemInformationViewTab.commands
				default: EmptyView()
			}
		}
		CommandGroup(replacing: .help) {}
	}
}
