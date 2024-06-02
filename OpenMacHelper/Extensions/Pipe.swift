//
//  Pipe.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

extension Pipe {
    var string: String {
        String(decoding: self.fileHandleForReading.readDataToEndOfFile(), as: UTF8.self)
    }
}
