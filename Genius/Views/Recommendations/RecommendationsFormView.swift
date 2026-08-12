//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import Foundation
import SwiftUI

struct RecommendationsFormView: View {

	@Default(.showResolvedRecommendations)
	var showResolvedRecommendations: Bool

	var body: some View {
		FormView(
			textWhenEmpty: showResolvedRecommendations ? .noRecommendationsAvailable : .allRecommendationsResolved,
			content: [
				.theftProtection: [
					RecommendationLabel(
						.activationLock,
						help: URL(appleSupportArticle: 102_541),
						setting: SystemSetting.iCloud,
					): SystemInformation.Recommendations.TheftProtection.activationLock,
					RecommendationLabel(
						.firmwarePassword,
						help: URL(appleSupportArticle: 102_384),
						setting: Application.startupSecurityUtility,
					): SystemInformation.Recommendations.TheftProtection.firmwarePassword,
				],
				.dataSecurity: [
					RecommendationLabel(
						.fileVault,
						help: URL(appleUserGuideArticle: "mh11785"),
						setting: SystemSetting.fileVault,
					): SystemInformation.Recommendations.DataSecurity.fileVault,
				],
				.malwareProtection: [
					RecommendationLabel(
						.systemIntegrityProtection,
						help: URL(appleSupportArticle: 102_149),
					): SystemInformation.Recommendations.MalwareProtection.systemIntegrityProtection,
					RecommendationLabel(
						.firewall,
						help: URL(appleUserGuideArticle: "mh34041"),
						setting: SystemSetting.firewall,
					): SystemInformation.Recommendations.MalwareProtection.firewall,
					RecommendationLabel(
						.gatekeeper,
						help: URL(appleSupportArticle: 102_445),
						setting: SystemSetting.security,
					): SystemInformation.Recommendations.MalwareProtection.gatekeeper,
					RecommendationLabel(
						.askToAllowAccessoriesToConnect,
						help: URL(appleSupportArticle: 102_282),
						setting: SystemSetting.accessories ?? Application.startupSecurityUtility,
					): SystemInformation.Recommendations.MalwareProtection.allowAccessoriesToConnect,
				],
				.automaticUpdates: [
					RecommendationLabel(
						.checkForMacOSUpdates,
						help: URL(appleSupportArticle: 108_382),
						setting: SystemSetting.softwareUpdate,
					): SystemInformation.Recommendations.AutomaticUpdates.checkMacOS,
					RecommendationLabel(
						.downloadMacOSUpdates,
						help: URL(appleSupportArticle: 108_382),
						setting: SystemSetting.softwareUpdate,
					): SystemInformation.Recommendations.AutomaticUpdates.downloadMacOS,
					RecommendationLabel(
						.installMacOSUpdates,
						help: URL(appleSupportArticle: 108_382),
						setting: SystemSetting.softwareUpdate,
					): SystemInformation.Recommendations.AutomaticUpdates.installMacOS,
					RecommendationLabel(
						.installCriticalUpdates,
						help: URL(appleSupportArticle: 101_591),
						setting: SystemSetting.softwareUpdate,
					): SystemInformation.Recommendations.AutomaticUpdates.installCritical,
					RecommendationLabel(
						.installConfigurationDataUpdates,
						help: URL(appleSupportArticle: 101_591),
						setting: SystemSetting.softwareUpdate,
					): SystemInformation.Recommendations.AutomaticUpdates.installConfigurationData,
					RecommendationLabel(
						.backgroundSecurityImprovements,
						help: URL(appleSupportArticle: 102_657),
						setting: SystemSetting.backgroundSecurityImprovements,
					): SystemInformation.Recommendations.AutomaticUpdates.backgroundSecurityImprovements,
					RecommendationLabel(
						.installAppStoreAppUpdates,
						help: URL(appleSupportArticle: 102_629),
						setting: {
							if #available(macOS 26, *) {
								URL(
									string: "macappstore:showSettingsPage",
									available: SystemInformation.Software.OS.bootMode.value !=? .recovery,
								)
							} else {
								SystemSetting.softwareUpdate
							}
						}(),
					): SystemInformation.Recommendations.AutomaticUpdates.installAppStoreApps,
				],
			],
		)
		.id(showResolvedRecommendations)
	}
}

#Preview {
	RecommendationsFormView()
		.frame(width: 712, height: 256)
}
