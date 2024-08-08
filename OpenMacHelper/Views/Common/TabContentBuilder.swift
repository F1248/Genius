//
//  TabContentBuilder.swift
//  OpenMacHelper
//
//  Created by F1248.
//

@resultBuilder
enum TabContentBuilder {

    static func buildBlock(_ tabs: TabLegacy...) -> [TabLegacy] {
        tabs
    }
}
