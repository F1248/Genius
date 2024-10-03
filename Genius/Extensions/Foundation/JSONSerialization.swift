//
//  JSONSerialization.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import Foundation

extension JSONSerialization {

    class func jsonOptionalObject(with data: Data?, options opt: JSONSerialization.ReadingOptions = []) throws -> Any? {
        guard let data else { return nil }
        return try Foundation.JSONSerialization.jsonObject(with: data, options: opt)
    }
}
