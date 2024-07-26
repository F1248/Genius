//
//  Data.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

extension Data {

    init?(_ string: (any StringProtocol)?) {
        guard let data = string?.data(using: .utf8) else {
            logger.error("Data(\"\(string.debugDescription)\": String?) failed")
            return nil
        }
        self = data
    }
}
