//
//  Double.swift
//  Genius
//
//  Created by F1248.
//

import Foundation

extension Double {

    init?(_ string: (any StringProtocol)?) {
        guard let string else { return nil }
        self.init(string.replacingOccurrences(of: ",", with: "."))
    }
}
