//
//  Double.swift
//  Genius
//
//  Created by F1248.
//

extension Double {

    init?(_ string: (any StringProtocol)?) {
        guard let string else { return nil }
        self.init(string.replacingOccurrences(of: ",", with: "."))
    }
}
