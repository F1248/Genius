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
            logger.error("Initialization URL(String?) failed: path = nil")
            return nil
        }
        guard FileManager.default.fileExists(atPath: path) else {
            logger.error("Initialization URL(String?) failed because path does not exist: path = \(path)")
            return nil
        }
        self.init(fileURLWithPath: path)
    }
}
