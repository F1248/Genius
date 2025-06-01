<!--
© 2024 F1248 <f1248@mailbox.org>
See LICENSE.txt for license information.
-->

[Zu Deutsch wechseln](README_DE.md)

# Genius – The Intelligent Universal macOS Helper Tool for Everyone!

## Table of Contents

- [Requirements](#requirements)
	- [Supported macOS Versions](#supported-macos-versions)
	- [Supported Models](#supported-models)
- [Installation](#installation)
	- [Manual Installation](#manual-installation-not-possible-in-recoveryos)
	- [Command Line Installation](#command-line-installation)
- [Notes for use in recoveryOS](#notes-for-use-in-recoveryos)
- [Copyright](#copyright)
- [License](#license)

## Requirements

### Supported macOS Versions

- macOS Sonoma 14 and later, including macOS Sequoia 15
- Also supports recoveryOS

### Supported Models

- Macs (including officially unsupported ones), Hackintoshes, and virtual machines

## Installation

### Manual Installation (not possible in recoveryOS)

1. Download [the latest build](https://nightly.link/F1248/Genius/workflows/Build-Genius/deployment-target-macos-14/Genius.zip).
2. If not already unzipped automatically, double-click `Genius.zip` to unzip it.
3. Move `Genius.app` into `/Applications`.
4. Double-click the app.

On macOS Sequoia 15:

5. Click `Done`.
6. Open [`Privacy & Security` in System Settings, scroll down to the message `“Genius.app” was blocked to protect your Mac.`](https://f1248.github.io/r?d=x-apple.systempreferences:com.apple.settings.PrivacySecurity.extension?Security) and click `Open Anyway`.
7. Click `Open Anyway` again.
8. Authenticate yourself.

On macOS Sonoma 14:

5. Click `Cancel`.
6. Right-click the app and choose `Open`.
7. Click `Open` again.

### Command Line Installation

Paste and run this command in a terminal:

```shellsession
curl https://f1248.github.io/deployment-target-macos-14 | sh
```

## Notes for use in recoveryOS

- To open Genius run `genius` in Terminal.
- Genius only remains installed until restarting.

## Copyright
© 2024 - 2025 F1248 <[f1248@mailbox.org](mailto:f1248@mailbox.org)>

## License
See [LICENSE.txt](LICENSE.txt) for license information.
