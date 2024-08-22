//
//  Bool.swift
//  Genius
//
//  Created by F1248.
//

extension Bool {

    init?(_ string: Any?) {
        guard let string = string as? String else { return nil }
        if string.contains(any: [
            "1",
            "true",
            "enabled",
            "spfirewall_globalstate_limit_connections",
            "spfirewall_globalstate_block_all",
        ]) {
            self = true
        } else if string.contains(any: [
            "0",
            "false",
            "disabled",
            "spfirewall_globalstate_allow_all",
        ]) {
            self = false
        } else { return nil }
    }
}
