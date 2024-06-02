//
//  Pipe.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

extension Pipe {

    func read() -> String? {
        guard let data = try? fileHandleForReading.readToEnd() else { return nil }
        return String(decoding: data, as: UTF8.self)
    }
}
