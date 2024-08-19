//
//  Tab.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

extension Tab where Value == Never, Content: View {

    init(_ titleKey: LocalizedStringKey, content: () -> Content) where Label == DefaultTabLabel {
        self.init(titleKey, systemImage: "", content: content)
    }
}
