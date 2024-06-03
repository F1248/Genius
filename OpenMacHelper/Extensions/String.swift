//
//  String.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import os
import SwiftUI

extension String {

    var debugText: String {
        isEmpty ? "None" : "\"\(trimmingCharacters(in: .whitespacesAndNewlines))\""
    }

    var localized: String {
        LocalizedStringKey(self).string
    }

    var url: URL? {
        guard FileManager.default.fileExists(atPath: self) else {
            Logger().error("URL does not exist: \(debugText)")
            return nil
        }
        return URL(fileURLWithPath: self)
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

    var url: URL? {
        guard let self else {
            Logger().error("URL is nil")
            return nil
        }
        return self.url
    }

    func hasPrefix(_ prefix: String) -> Bool {
        guard let self else { return false }
        return self.hasPrefix(prefix)
    }
}
