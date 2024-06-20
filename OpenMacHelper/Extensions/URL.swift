//
//  URL.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

extension URL {

    init?(_ path: String?) {
        guard let path else {
            logger.error("URL(\"\(path.debugDescription)\": String?) failed, path is nil")
            return nil
        }
        guard FileManager.default.fileExists(atPath: path) else {
            logger.error("URL(\"\(path)\": String?) failed, path does not exist")
            return nil
        }
        self.init(fileURLWithPath: path)
    }
}
