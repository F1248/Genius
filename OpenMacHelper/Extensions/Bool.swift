//
//  Bool.swift
//  OpenMacHelper
//
//  Created by F1248.
//

extension Bool {

    init?(_ string: Any?) {
        guard let string = string as? String else { return nil }
        if string.contained(["enabled", "true", "1", "spfirewall_globalstate_limit_connections", "spfirewall_globalstate_block_all"]) { self = true; return }
        if string.contained(["disabled", "false", "0", "spfirewall_globalstate_allow_all"]) { self = false; return }
        logger.error("Bool(\"\(string)\": Any?) failed: unknown string")
        return nil
    }
}
