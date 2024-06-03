//
//  Int.swift
//  OpenMacHelper
//
//  Created by F1248.
//

extension Int {

    init?(_ description: String?) {
        guard let description else { return nil }
        self.init(description)
    }
}
