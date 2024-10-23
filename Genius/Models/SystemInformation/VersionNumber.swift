//
// VersionNumber.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

struct VersionNumber {

    let versions: [Int]

    var major: Int? { versions.first }

    init?(_ versionNumber: Any?) {
        let components = (versionNumber as? Substring)?.split(separator: ".")
        guard !components.isEmpty, let versions = [Int](components) else { return nil }
        self.versions = versions
    }
}
