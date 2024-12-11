[Zu Deutsch wechseln](README_DE.md)

# Genius – The Intelligent Universal macOS Helper for Everyone!

## Table of Contents

- [Requirements](#requirements)
	- [Supported macOS Versions](#supported-macos-versions)
	- [Supported Models](#supported-models)
- [Installation](#installation)
	- [Manual Installation](#manual-installation-not-possible-in-recoveryos)
	- [Command Line Installation](#command-line-installation)
- [Copyright](#copyright)
- [License](#license)

## Requirements

### Supported macOS Versions

- macOS Big Sur 11 and later, including macOS Sequoia 15
- Also supports recoveryOS

### Supported Models

- Macs (including officially unsupported ones), Hackintoshes, and virtual machines

## Installation

### Manual Installation (not possible in recoveryOS)

1. Download [the latest build](https://nightly.link/F1248/Genius/workflows/Build-Genius/main/Genius.zip).
2. If not already unzipped automatically, double-click `Genius.zip` to unzip it.
3. Move `Genius.app` into `/Applications`.
4. Double-click the app.

On macOS Sequoia 15:

5. Click `Done`.
6. Open [`Privacy & Security` in System Settings](https://f1248.github.io/r?d=x-apple.systempreferences:com.apple.settings.PrivacySecurity.extension), scroll down to the message `“Genius.app” was blocked to protect your Mac.` and click `Open Anyway`.
7. Click `Open Anyway` again.
8. Authenticate yourself.

On macOS Sonoma 14 and older:

5. Click `Cancel`.
6. Right-click the app and choose `Open`.
7. Click `Open` again.

### Command Line Installation

In Terminal, paste and run the following command:

```shellsession
curl https://f1248.github.io | sh
```

To open Genius run `genius` in Terminal.

Note that Genius will need to be reinstalled after a reboot.

## Copyright
© 2024 F1248 <[f1248@mailbox.org](mailto:f1248@mailbox.org)>

## License
See [LICENSE.txt](LICENSE.txt) for license information.
