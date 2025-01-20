//
// AppDelegate.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency
import AppKit
import ObjectiveC

class AppDelegate: NSObject, NSApplicationDelegate {

	func applicationShouldTerminateAfterLastWindowClosed(_: NSApplication) -> Bool { true }

	func applicationDockMenu(_: NSApplication) -> NSMenu? {
		let dockMenu = NSMenu()
		for tab in ContentViewTab.allCases {
			let menuItem = NSMenuItem(title: tab.localizedString, action: #selector(changeTab(_:)), keyEquivalent: "")
			menuItem.tag = tab.index
			dockMenu.addItem(menuItem)
		}
		return dockMenu
	}

	@MainActor
	@objc
	func changeTab(_ sender: NSMenuItem) {
		sharedData.selectedTabsIndices[ContentViewTab.id] = sender.tag
	}
}
