//
//  URL.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation
import os

extension URL {

    init?(_ path: String?) {
        guard let path else {
            logger.error("Path is nil")
            return nil
        }
        guard FileManager.default.fileExists(atPath: path) else {
            logger.error("Path does not exist: \(path.debugText)")
            return nil
        }
        self.init(fileURLWithPath: path)
    }
}

extension URL? {

    var debugText: String {
        (self?.absoluteString.dropPrefix("file://")).debugText
    }
}
