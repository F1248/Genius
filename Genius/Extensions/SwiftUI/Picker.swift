//
//  Picker.swift
//  Genius
//
//  Created by F1248.
//

import SwiftUI
import SwiftUICore

extension Picker {

    init(selection: Binding<SelectionValue>, content: () -> Content) where EmptyView == Label {
        self.init(selection: selection, content: content) { EmptyView() }
    }
}
