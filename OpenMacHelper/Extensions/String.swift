//
//  String.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

extension String {

    var debugText: String {
        isEmpty ? "None" : "\"\(trimmingCharacters(in: .whitespacesAndNewlines))\""
    }

    var localized: String {
        LocalizedStringKey(self).string
    }

    func contains(_ strings: [String]) -> Bool {
        strings.contains { contains($0) }
    }

    func dropPrefix(_ prefix: String) -> String {
        hasPrefix(prefix) ? String(dropFirst(prefix.count)) : self
    }
}

extension Optional where Wrapped == String {

    var debugText: String {
        self?.debugText ?? "nil"
    }

    func hasPrefix(_ prefix: String) -> Bool {
        guard let self else { return false }
        return self.hasPrefix(prefix)
    }
}
