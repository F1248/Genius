//
//  Hardware.swift
//  Genius
//
//  Created by F1248.
//

import SwiftUI

extension SystemInformation {

    enum Hardware {

        enum Model {

            static let name: String? = SystemProfiler.hardware?["machine_name"] as? String
            static let identifier: String? = SystemProfiler.hardware?["machine_model"] as? String
            static let number: String? = SystemProfiler.hardware?["model_number"] as? String
            static let appleSiliconBased: Bool = SystemProfiler.hardware.contains(key: "chip_type")
            static let intelBased: Bool = SystemProfiler.hardware.contains(key: "cpu_type")
            static let isLaptop: Bool = name.hasPrefix("MacBook")
            static let systemImage: String =
                switch name {
                case _ where name.hasPrefix("MacBook"):
                    switch identifier {
                    case "Mac14,7": "macbook.gen1"
                    case _ where identifier.hasPrefix("MacBookPro18"): "macbook.gen2"
                    case _ where identifier.hasPrefix("MacBook"): "macbook.gen1"
                    default: "macbook.gen2"
                    }
                case "iMac", "iMac Pro": "desktopcomputer"
                case "Mac mini": "macmini"
                case "Mac Studio": "macstudio"
                case "Mac Pro":
                    switch identifier {
                    case "MacPro3,1", "MacPro4,1", "MacPro5,1": "macpro.gen1"
                    case "MacPro6,1": "macpro.gen2"
                    default: "macpro.gen3"
                    }
                case "Xserve": "xserve"
                case _ where name.hasPrefix("Apple Virtual Machine"): "macwindow"
                default: "desktopcomputer.and.macbook"
                }
            static let marketingName: String? = {
                guard let serialNumber = Machine.serialNumber, [11, 12].contains(serialNumber.count) else { return nil }
                // swiftlint:disable:next explicit_type_interface
                let url = """
                https://support-sp.apple.com/sp/product?\
                cc=\(serialNumber.dropFirst(8))&\
                lang=\(Locale.currentLanguageCode ?? "")
                """
                guard
                    let marketingName = Network.transferURL(url)?.between(start: "<configCode>", end: "</configCode>")
                else { return nil }
                return marketingName
            }()
        }

        enum Specifications {

            enum CPU {

                enum Cores {

                    static let total: Int? = cores?.0
                    static let performance: Int? = cores?.1
                    static let efficiency: Int? = cores?.2

                    static let cores: (Int?, Int?, Int?)? = {
                        if Model.appleSiliconBased {
                            let components = [Int](
                                (SystemProfiler.hardware?["number_processors"] as? String)?
                                    .remove("proc ").split(separator: ":")
                            )
                            return (components?[0], components?[1], components?[2])
                        }
                        if Model.intelBased {
                            return (SystemProfiler.hardware?["number_processors"] as? Int, nil, nil)
                        }
                        return nil
                    }()
                }

                static let name: String? =
                    SystemProfiler.hardware?["chip_type"] as? String ??
                    SystemProfiler.hardware?["cpu_type"] as? String
                static let speed: Measurement<UnitFrequency>? = Measurement(SystemProfiler.hardware?["current_processor_speed"])
            }

            static let memory: Measurement<UnitInformationStorage>? = Measurement(SystemProfiler.hardware?["physical_memory"])
        }

        enum Machine {

            static let serialNumber: String? = SystemProfiler.hardware?["serial_number"] as? String
            static let hardwareUUID: String? = SystemProfiler.hardware?["platform_UUID"] as? String
            static let provisioningUDID: String? = SystemProfiler.hardware?["provisioning_UDID"] as? String
        }
    }
}
