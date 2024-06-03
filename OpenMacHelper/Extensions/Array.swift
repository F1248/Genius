//
//  Array.swift
//  OpenMacHelper
//
//  Created by F1248.
//

extension Array where Element == Int {

    init?(versionNumber: Any?) {
        guard let versionNumber = versionNumber as? String else { return nil }
        self.init(versionNumber.components(separatedBy: ".").compactMap { Int($0) })
    }
}

extension Array {

    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

extension Optional where Wrapped == [String] {

    var debugText: String {
        (self?.joined(separator: "\", \"")).debugText
    }
}
