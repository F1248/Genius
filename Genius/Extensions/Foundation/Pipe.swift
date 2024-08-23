//
//  Pipe.swift
//  Genius
//
//  Created by F1248.
//

import Foundation

extension Pipe {

    func read() -> String? {
        String(try? fileHandleForReading.readToEnd())
    }
}
