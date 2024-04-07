//
//  SystemInformationGroupBox.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct SystemInformationGroupBox: View {

    var label: String?
    var contents: [(String, Any?)]

    var body: some View {
        GroupBox(
            label: Text(convertToLocalizedStringKey(label))
                .font(.title)
        ) {
            ForEach(contents, id: \.0) { key, value in
                HStack {
                    Text(key)
                    Spacer()
                    Text(convertToLocalizedStringKey(value))
                }
                if key != contents.last?.0 { Divider() }
            }
        }
        .frame(maxWidth: 512)
    }
}

#Preview {
    SystemInformationGroupBox(
        label: SystemInformation().software.os.name,
        contents: [
            ("Version", SystemInformation().software.os.version),
            ("Build", SystemInformation().software.os.build)
        ]
    )
}
