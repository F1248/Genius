//
//  String.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

extension String {

    var localized: String {
        NSLocalizedString(self, comment: "")
    }

    init?(_ string: (any StringProtocol)?) {
        guard let string else { return nil }
        self = String(string)
    }

    init(_ localizedStringKey: LocalizedStringKey) {
        self = (
            Mirror(reflecting: localizedStringKey).children.first { $0.label == "key" }?.value as? String ?? "Unknown"
        ).localized
    }

    func containsAny(_ strings: [any StringProtocol]) -> Bool {
        strings.contains { contains($0) }
    }

    func dropPrefix(_ prefix: any StringProtocol) -> String {
        hasPrefix(prefix) ? String(dropFirst(prefix.count)) : self
    }

    func remove(_ string: any StringProtocol) -> String {
        replacingOccurrences(of: string, with: "")
    }
}

extension String? {

    func hasPrefix(_ prefix: any StringProtocol) -> Bool {
        guard let self else { return false }
        return self.hasPrefix(prefix)
    }
}
