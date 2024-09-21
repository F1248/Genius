//
//  AppDelegate.swift
//  Genius
//
//  Created by F1248.
//

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

    @objc
    func changeTab(_ sender: NSMenuItem) {
        sharedData.selectedTabIndex = sender.tag
    }
}
