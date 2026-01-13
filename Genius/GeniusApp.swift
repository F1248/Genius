//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import AppKit
import Defaults
import SwiftUI

@main
struct GeniusApp: App {

	@NSApplicationDelegateAdaptor var appDelegate: AppDelegate // swiftlint:disable:this unused_declaration

	var body: some Scene {
		if #available(macOS 15, *) {
			// swiftformat:disable:next redundantReturn
			return WindowGroup {
				if #available(macOS 26, *) {
					ContentView()
						.toolbarBackgroundVisibility(.hidden, for: .automatic)
				} else {
					ContentView()
				}
			}
			.windowToolbarStyle(.unified(showsTitle: false))
			.windowToolbarLabelStyle(fixed: .iconOnly)
			.commands(content: AppCommands.init)
		} else {
			// swiftformat:disable:next redundantReturn
			return WindowGroup {
				ContentView()
			}
			.windowToolbarStyle(.unified(showsTitle: false))
			.commands(content: AppCommands.init)
		}
	}

	init() {
		if #available(macOS 26, *) {
			if Defaults[.disableLiquidGlass] { NSAppearance.disableLiquidGlass() }
		}
		NSWindow.allowsAutomaticWindowTabbing = false
		if (SystemInformation.Software.OS.bootMode.value !=? .recovery) ?? true {
			_ = updater
		}
	}
}
