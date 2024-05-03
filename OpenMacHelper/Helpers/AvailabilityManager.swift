//
//  AvailabilityManager.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

var languageCode: String? {
    if #available(macOS 13, *) {
        Locale.current.language.languageCode?.identifier
    } else {
        Locale.current.languageCode
    }
}
