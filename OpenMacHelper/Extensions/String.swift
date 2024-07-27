//
//  String.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

extension String {

    init(_ localizedStringKey: LocalizedStringKey) {
        self = (Mirror(reflecting: localizedStringKey).children.first { $0.label == "key" }?.value as? String ?? "Unknown").localized
    }

    var localized: String {
        NSLocalizedString(self, comment: String())
    }

    func contains(_ strings: [any StringProtocol]) -> Bool {
        strings.contains { contains($0) }
    }

    func dropPrefix(_ prefix: any StringProtocol) -> String {
        hasPrefix(prefix) ? String(dropFirst(prefix.count)) : self
    }

    func remove(_ string: any StringProtocol) -> String {
        replacingOccurrences(of: string, with: String())
    }
}

extension String? {

    func hasPrefix(_ prefix: any StringProtocol) -> Bool {
        guard let self else { return false }
        return self.hasPrefix(prefix)
    }
}
