//
// AppCommands.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct AppCommands: Commands {

	@ObservedObject var observedSharedData: SharedData = sharedData // swiftlint:disable:this unused_declaration

	var body: some Commands {
		CommandGroup(replacing: .appSettings) {
			TabButton(tab: ContentViewTab.settings)
		}
		CommandGroup(replacing: .newItem) { EmptyView() }
		CommandGroup(before: .toolbar) {
			TabViewButtons<ContentViewTab>()
			switch ContentViewTab.selection {
				case .systemInformation: TabViewButtons<SystemInformationViewTab>()
				default: EmptyView()
			}
		}
		CommandGroup(replacing: .help) { EmptyView() }
	}
}
