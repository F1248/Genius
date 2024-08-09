//
//  LocalizedStringKey.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

extension LocalizedStringKey {

    init(_ versionNumber: VersionNumber) {
        self.init(versionNumber.versions.map(String.init).joined(separator: "."))
    }
}
