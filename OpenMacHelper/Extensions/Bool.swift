//
//  Bool.swift
//  OpenMacHelper
//
//  Created by F1248.
//

extension Bool {

    init?(_ string: Any?) {
        guard let string = string as? String else { return nil }
        if string.containsAny([
            "enabled",
            "true",
            "1",
            "spfirewall_globalstate_limit_connections",
            "spfirewall_globalstate_block_all"
        ]) {
            self = true
        } else if string.containsAny([
            "disabled",
            "false",
            "0",
            "spfirewall_globalstate_allow_all"
        ]) {
            self = false
        } else {
            logger.error("Bool(\"\(string)\": Any?) failed: unknown string")
            return nil
        }
    }
}
