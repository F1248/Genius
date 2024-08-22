//
//  Data.swift
//  Genius
//
//  Created by F1248.
//

import Foundation

extension Data {

    init?(_ string: (any StringProtocol)?) {
        guard let data = string?.data(using: .utf8) else { return nil }
        self = data
    }
}
