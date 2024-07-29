//
//  VersionNumber.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct VersionNumber {

    let versions: [Int]
    var major: Int? { versions.first }

    var localized: LocalizedStringKey {
        LocalizedStringKey(versions.map(String.init).joined(separator: "."))
    }

    init?(_ versionNumber: Any?) {
        guard let versionNumber = versionNumber as? Substring else { return nil }
        let components = versionNumber.split(separator: ".")
        guard !components.isEmpty else { return nil }
        self.versions = components.compactMap { Int($0) }
        guard self.versions.count == components.count else { return nil }
    }
}
