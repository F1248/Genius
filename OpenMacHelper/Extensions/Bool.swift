//
//  Bool.swift
//  OpenMacHelper
//
//  Created by F1248.
//

extension Bool {

    init?(_ any: Any?) {
        guard let any = any as? String else { return nil }
        if any.contains(["enabled", "true", "1", "spfirewall_globalstate_limit_connections", "spfirewall_globalstate_block_all"]) { self.init(true) }
        if any.contains(["disabled", "false", "0", "spfirewall_globalstate_allow_all"]) { self.init(false) }
        return nil
    }
}
