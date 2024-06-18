//
//  String.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

extension String {

    init(_ localizedStringKey: LocalizedStringKey) {
        self = NSLocalizedString(Mirror(reflecting: localizedStringKey).children.first { $0.label == "key" }?.value as? String ?? "Unknown".localized, comment: String())
    }

    var localized: String {
        String(LocalizedStringKey(self))
    }

    func contains(_ strings: [String]) -> Bool {
        strings.contains { contains($0) }
    }

    func dropPrefix(_ prefix: String) -> String {
        hasPrefix(prefix) ? String(dropFirst(prefix.count)) : self
    }

    func remove(_ string: String) -> String {
        replacingOccurrences(of: string, with: String())
    }
}

extension String? {

    func hasPrefix(_ prefix: String) -> Bool {
        guard let self else { return false }
        return self.hasPrefix(prefix)
    }
}
