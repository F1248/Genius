//
//  VersionNumber.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

typealias VersionNumber = [Int]

extension VersionNumber {

    init?(_ versionNumber: Any?) {
        guard let versionNumber = versionNumber as? String else { return nil }
        let components = versionNumber.components(separatedBy: ".")
        self = components.compactMap { Int($0) }
        guard !self.isEmpty, self.count == components.count else { return nil }
    }

    var localized: LocalizedStringKey {
        LocalizedStringKey(self.map(String.init).joined(separator: "."))
    }
}
