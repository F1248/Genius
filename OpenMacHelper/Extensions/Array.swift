//
//  Array.swift
//  OpenMacHelper
//
//  Created by F1248.
//

extension Array {

    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

extension [Int] {

    init?(versionNumber: Any?) {
        guard let versionNumber = versionNumber as? String else { return nil }
        self = versionNumber.components(separatedBy: ".").compactMap { Int($0) }
    }

    init?(_ strings: [String]?) {
        guard let strings else { return nil }
        self = strings.compactMap { Int($0) }
    }
}

extension [String]? {

    var debugText: String {
        (self?.joined(separator: "\", \"")).debugText
    }
}
