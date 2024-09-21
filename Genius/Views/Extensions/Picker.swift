//
//  Picker.swift
//  Genius
//
//  Created by F1248.
//

import SwiftUI
import SwiftUICore

extension Picker {

    init(selection: Binding<SelectionValue>, content: () -> Content) where Label == EmptyView {
        self.init(selection: selection, content: content) { EmptyView() }
    }
}
