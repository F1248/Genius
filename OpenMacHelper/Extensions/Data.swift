//
//  Data.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

extension Data {

    init?(_ string: String?) {
        guard let data = string?.data(using: .utf8) else {
            logger.error("Initialization Data(String?) failed: string = \(string.debugText)")
            return nil
        }
        self = data
    }
}
