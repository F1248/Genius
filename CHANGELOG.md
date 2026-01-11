<!--
© 2025 F1248 <f1248@mailbox.org>
See LICENSE.txt for license information.
-->

# Changelog

## Unreleased

### Added

### Improved

- Remove logs when uninstalling Genius
- Show `ProgressView` in `FormView` only the first time
- Show `ProgressView` in `FormView` for each entry individually

### Fixed

- Fix uninstallation in recoveryOS

### Security

- Require signed appcast feed

### Dependencies

- Update [Xcode](https://developer.apple.com/xcode) from [26.1.1](https://developer.apple.com/documentation/xcode-release-notes/xcode-26_1-release-notes) to [26.2.0](https://developer.apple.com/documentation/xcode-release-notes/xcode-26_2-release-notes)

### [Commit History](https://github.com/F1248/Genius/compare/v0.4.0...HEAD)

## [0.4.0](https://github.com/F1248/Genius/releases/tag/v0.4.0)

### Added

- Make Model → Configuration Code and Name available on devices with 10-digit serial numbers
- Add Background Security Improvements introduced in macOS 26.1 to Maintenance → Automatic Updates
- Add Board to System Information → Hardware → Model
- Add CPU Identifier to System Information → Hardware → Specifications
- Add Configuration Code to System Information → Hardware → Model

### Improved

- Remove “Scale to fit below built-in camera” setting from Finder Info window
- Add “macOS” to macOS → Code Name
- Rename “Not applicable” to “Not available”

### Fixed

- Fix System Information → Hardware symbol on future devices
- Fix macOS → Code Name on future macOS versions
- Disable app updates in recoveryOS as Sparkle does not work there
- Fix `SettingPicker` not always displaying options vertically
- Fix duplicate `Section`s on macOS 13

### Dependencies

- Update [SFSafeSymbols](https://github.com/SFSafeSymbols/SFSafeSymbols) from [6.2.0](https://github.com/SFSafeSymbols/SFSafeSymbols/releases/tag/6.2.0) to [7.0.0](https://github.com/SFSafeSymbols/SFSafeSymbols/releases/tag/7.0.0)
- Update [Xcode](https://developer.apple.com/xcode) from [26.0.1](https://developer.apple.com/documentation/xcode-release-notes/xcode-26_0_1-release-notes) to [26.1.1](https://developer.apple.com/documentation/xcode-release-notes/xcode-26_1-release-notes)
- Update [Sparkle](https://github.com/sparkle-project/Sparkle) from [2.8.0](https://github.com/sparkle-project/Sparkle/releases/tag/2.8.0) to [2.8.1](https://github.com/sparkle-project/Sparkle/releases/tag/2.8.1)

### [Commit History](https://github.com/F1248/Genius/compare/v0.3.0...v0.4.0)

## [0.3.0](https://github.com/F1248/Genius/releases/tag/v0.3.0)

### Added

- Add buttons to reset each setting to its default value
- Add help text to `Symbol`s when showing symbol

### Improved

- Align `content` in `TabData.body` to the top
- Use `Form`s instead of `GroupBox`es

### [Commit History](https://github.com/F1248/Genius/compare/v0.2.0...v0.3.0)

## [0.2.0](https://github.com/F1248/Genius/releases/tag/v0.2.0)

### Added

- Add app updates

### Improved

- Group settings

### Fixed

- Fix `TabView` not always being displayed

### Security

- Enable hardware memory tagging

### Dependencies

- Update [Xcode](https://developer.apple.com/xcode) from [26.0.0](https://developer.apple.com/documentation/xcode-release-notes/xcode-26-release-notes) to [26.0.1](https://developer.apple.com/documentation/xcode-release-notes/xcode-26_0_1-release-notes)
- Update [Defaults](https://github.com/sindresorhus/Defaults) from [9.0.5](https://github.com/sindresorhus/Defaults/releases/tag/9.0.5) to [9.0.6](https://github.com/sindresorhus/Defaults/releases/tag/9.0.6)

### [Commit History](https://github.com/F1248/Genius/compare/v0.1.0...v0.2.0)

## [0.1.0](https://github.com/F1248/Genius/releases/tag/v0.1.0)

### [Commit History](https://github.com/F1248/Genius/commits/v0.1.0)
