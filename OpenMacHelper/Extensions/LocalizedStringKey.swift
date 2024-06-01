//
//  LocalizedStringKey.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

extension LocalizedStringKey {
    var string: String {
        NSLocalizedString(Mirror(reflecting: self).children.first { $0.label == "key" }?.value as? String ?? "Unknown".localized, comment: String())
    }
}
