//
//  Picker.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

extension Picker {

    init(selection: Binding<SelectionValue>, content: () -> Content) where EmptyView == Label {
        self.init(selection: selection, content: content) { EmptyView() }
    }
}
