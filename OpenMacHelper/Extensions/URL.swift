// swiftlint:disable:this file_name

//
//  URL.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

extension Optional where Wrapped == URL {

    var debugText: String {
        (self?.absoluteString.dropPrefix("file://")).debugText
    }
}
