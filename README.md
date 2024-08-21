[Zu Deutsch wechseln](README_DE.md)

# OpenMacHelper: The Universal Helper for macOS!

## Requirements:

### Supported macOS Versions
* macOS Big Sur 11 and later, including recoveryOS

### Supported Models
* Macs (including officially unsupported ones), Hackintoshes and virtual machines

## Installation:

### Manual Installation (not possible in recoveryOS):

1. Download [the latest build](https://nightly.link/F1248/OpenMacHelper/workflows/Build-OpenMacHelper/main/OpenMacHelper.zip).
2. If not already unzipped automatically, unzip `OpenMacHelper.zip`.
3. Move `OpenMacHelper.app` into `/Applications`.
4. Double-click the app.

On macOS Sequoia 15:

5. Click `Done`.
6. Open [`Privacy & Security` in System Settings](https://f1248.github.io/r?d=x-apple.systempreferences:com.apple.settings.PrivacySecurity.extension), scroll to the message `“OpenMacHelper.app” was blocked to protect your Mac.` and click `Open Anyway`.
7. Click `Open Anyway` again.
8. Authenticate yourself.

On macOS Sonoma 14 and older:

5. Click `Cancel`.
6. Right-click the app and choose `Open`.
7. Click `Open` again.

### Command Line Installation:

Paste and run the following command in Terminal. Note that in recoveryOS, OpenMacHelper will be removed by a reboot.

```
curl -L f1248.github.io | sh
```

To open OpenMacHelper in recoveryOS, simply run `OpenMacHelper` in Terminal.
