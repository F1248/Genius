//
//  Pipe.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

extension Pipe {
    var read: String? {
        guard let data = try? self.fileHandleForReading.readToEnd() else { return nil }
        return String(decoding: data, as: UTF8.self)
    }
}
