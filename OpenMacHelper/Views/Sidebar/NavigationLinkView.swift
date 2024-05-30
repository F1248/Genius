//
//  NavigationLinkView.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct NavigationLinkView<Destination: View>: View {

    let destination: Destination
    let title: String
    let systemImage: String
    let tag: SidebarItem
    let keyboardShortcutKey: KeyEquivalent

    var body: some View {
        NavigationLink {
            destination
        } label: {
            Label(LocalizedStringKey(title), systemImage: systemImage)
                .font(.title2)
                .padding(4)
        }
        .tag(tag)
        .keyboardShortcut(keyboardShortcutKey, modifiers: [.command])
    }
}

#Preview {
    NavigationLinkView(destination: HomeView(), title: "Home", systemImage: "house", tag: .home, keyboardShortcutKey: "0")
}
