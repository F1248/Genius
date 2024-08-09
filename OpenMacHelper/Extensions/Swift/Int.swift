//
//  Int.swift
//  OpenMacHelper
//
//  Created by F1248.
//

extension Int {

    init?(_ string: (any StringProtocol)?) {
        guard let string else { return nil }
        self.init(string)
    }
}
