//
//  String.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

extension String {

    func dropPrefix(_ prefix: String) -> String {
        self.hasPrefix(prefix) ? String(self.dropFirst(prefix.count)) : self
    }

    func contains(_ strings: [String]) -> Bool {
        strings.contains { contains($0) }
    }

    var localized: String {
        LocalizedStringKey(self).string
    }

    var debugText: String {
        self.isEmpty ? "None" : "\"\(self.trimmingCharacters(in: .whitespacesAndNewlines))\""
    }
}

extension Optional where Wrapped == String {

    var debugText: String {
        (self ?? String()).debugText
    }
}
