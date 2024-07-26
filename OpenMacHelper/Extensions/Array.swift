//
//  Array.swift
//  OpenMacHelper
//
//  Created by F1248.
//

extension Array {

    subscript(index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

extension [Int] {

    init?(_ strings: [String]?) {
        guard let strings else { return nil }
        self = strings.compactMap { Int($0) }
    }
}
