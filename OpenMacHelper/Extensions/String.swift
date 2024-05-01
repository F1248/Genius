//
//  String.swift
//  OpenMacHelper
//
//  Created by F1248.
//

extension String {
    func contains(_ strings: [String]) -> Bool {
        strings.contains { contains($0) }
    }
}
