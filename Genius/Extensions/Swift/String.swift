//
//  String.swift
//  Genius
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
        self.init(string)
    }

    init(_ localizedStringKey: LocalizedStringKey) {
        self = (
            Mirror(reflecting: localizedStringKey).children.first { $0.label == "key" }?.value as? String ?? "Unknown"
        ).localized
    }

    init(_ data: Data) {
        self.init(decoding: data, as: UTF8.self)
    }

    func contains(any strings: [any StringProtocol]) -> Bool {
        strings.contains { contains($0) }
    }

    func remove(_ string: any StringProtocol) -> String {
        replacingOccurrences(of: string, with: "")
    }

    func between(start: String, end: String) -> String? {
        guard
            let startRange = range(of: start)?.upperBound,
            let endRange = range(of: end, range: startRange..<endIndex)?.lowerBound
        else { return nil }
        return String(self[startRange..<endRange])
    }
}

extension String? {

    func hasPrefix(_ prefix: any StringProtocol) -> Bool {
        guard let self else { return false }
        return self.hasPrefix(prefix)
    }
}
