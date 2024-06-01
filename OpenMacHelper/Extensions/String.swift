//
//  String.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

extension String {

    func contains(_ strings: [String]) -> Bool {
        strings.contains { contains($0) }
    }

    var localized: String {
        LocalizedStringKey(self).string
    }
}
