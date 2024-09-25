//
//  String.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import Foundation

extension String {

    var localized: String {
        if #available(macOS 12, *) {
            String(localized: LocalizationValue(self))
        } else {
            NSLocalizedString(self, comment: "")
        }
    }

    init?(_ string: (any StringProtocol)?) {
        guard let string else { return nil }
        self.init(string)
    }

    init?(_ data: Data?) {
        guard let data else { return nil }
        self.init(decoding: data, as: UTF8.self)
    }

    init?(_ versionNumber: VersionNumber?) {
        self.init(versionNumber?.versions.map(String.init).joined(separator: "."))
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
