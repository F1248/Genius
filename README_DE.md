<!--
© 2024 F1248 <f1248@mailbox.org>
See LICENSE.txt for license information.
-->

[Switch to English](README.md)

# Genius – Das intelligente, universelle macOS-Hilfsprogramm für alle!

## Inhaltsverzeichnis

- [Anforderungen](#anforderungen)
	- [Unterstützte macOS-Versionen](#unterstützte-macos-versionen)
	- [Unterstützte Modelle](#unterstützte-modelle)
- [Installation](#installation)
	- [Manuelle Installation](#manuelle-installation-in-recoveryos-nicht-möglich)
	- [Befehlszeilen-Installation](#befehlszeilen-installation)
- [Hinweise zur Verwendung in recoveryOS](#hinweise-zur-verwendung-in-recoveryos)
- [Urheberrecht](#urheberrecht)
- [Lizenz](#lizenz)

## Anforderungen

### Unterstützte macOS-Versionen

- macOS Big Sur 11 und neuer, inklusive macOS Tahoe 26
- Unterstützt auch recoveryOS unter macOS Sonoma 14 und neuer

### Unterstützte Modelle

- Macs (inklusive offiziell nicht unterstützten), Hackintoshs und virtuelle Maschinen

## Installation

### Manuelle Installation (in recoveryOS nicht möglich)

1. Lade [den neusten Build](https://nightly.link/F1248/Genius/workflows/Build-app/main/Genius.zip) herunter.
2. Wenn nicht bereits automatisch entzippt, doppelklicke auf `Genius.zip`, um es zu entzippen.
3. Verschiebe `Genius.app` in `/Programme`.
4. Doppelklicke auf die App.

Unter macOS Sequoia 15 und neuer:

5. Klicke auf `Fertig`.
6. Öffne [`Datenschutz & Sicherheit` in den Systemeinstellungen, scrolle nach unten zu der Nachricht `„Genius“ wurde blockiert, um deinen Mac zu schützen.`](https://f1248.github.io/r?d=x-apple.systempreferences:com.apple.settings.PrivacySecurity.extension?Security) und klicke auf `Dennoch öffnen`.
7. Klicke erneut auf `Dennoch öffnen`.
8. Authentifiziere dich.

Unter macOS Sonoma 14 und älter:

5. Klicke auf `Abbrechen`.
6. Rechtsklicke auf die App und wähle `Öffnen`.
7. Klicke erneut auf `Öffnen`.

### Befehlszeilen-Installation

Füge diesen Befehl in ein Terminal ein und führe ihn aus:

```shellsession
curl https://f1248.github.io | sh
```

## Hinweise zur Verwendung in recoveryOS

- Um Genius zu öffnen, führe `genius` im Terminal aus.
- Genius bleibt nur bis zum Neustarten installiert.

## Urheberrecht
© 2024 - 2025 F1248 <[f1248@mailbox.org](mailto:f1248@mailbox.org)>

## Lizenz
Siehe [LICENSE.txt](LICENSE.txt) (in Englisch) für Lizenzinformationen.
