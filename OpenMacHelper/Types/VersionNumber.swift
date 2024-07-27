//
//  VersionNumber.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct VersionNumber {

    init?(_ versionNumber: Any?) {
        guard let versionNumber = versionNumber as? String else { return nil }
        let components = versionNumber.components(separatedBy: ".")
        guard !components.isEmpty else { return nil }
        self.versions = components.compactMap { Int($0) }
        guard self.versions.count == components.count else { return nil }
    }

    let versions: [Int]
    var major: Int? { versions.first }

    var localized: LocalizedStringKey {
        LocalizedStringKey(self.versions.map(String.init).joined(separator: "."))
    }
}
