//
//  Locale.swift
//  Genius
//
//  Created by F1248.
//

import Foundation

extension Locale {

    static let currentLanguageCode: String? =
        if #available(macOS 13, *) {
            Locale.current.language.languageCode?.identifier
        } else {
            Locale.current.languageCode
        }
}
