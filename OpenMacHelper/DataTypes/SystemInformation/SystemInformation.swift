//
//  SystemInformation.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation
import SwiftUI

class SystemInformation: ObservableObject {

    let hardware = Hardware()
    let software = Software()
    let maintenanceChecks = MaintenanceChecks()
}
