//
//  URL.swift
//  Genius
//
//  Created by F1248.
//

import Foundation

extension URL {

    init?(_ path: String?) {
        guard let path else { return nil }
        guard FileManager.default.fileExists(atPath: path) else { return nil }
        self.init(fileURLWithPath: path)
    }
}
