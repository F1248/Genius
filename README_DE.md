[Switch to English](README.md)

# Genius: Der intelligente, universelle macOS-Helfer für alle!

## Inhaltsverzeichnis

- [Anforderungen](#anforderungen)
	- [Unterstützte macOS-Versionen](#unterstützte-macos-versionen)
	- [Unterstützte Modelle](#unterstützte-modelle)
- [Installation](#installation)
	- [Manuelle Installation](#manuelle-installation-in-recoveryos-nicht-möglich)
	- [Befehlszeilen-Installation](#befehlszeilen-installation)
- [Urheberrecht](#urheberrecht)
- [Lizenz](#lizenz)

## Anforderungen:

### Unterstützte macOS-Versionen

- macOS Monterey 12 und neuer, inklusive macOS Sequoia 15
- Unterstützt auch recoveryOS

### Unterstützte Modelle

- Macs (inklusive offiziell nicht unterstützten), Hackintoshs und virtuelle Maschinen

## Installation:

### Manuelle Installation (in recoveryOS nicht möglich):

1. Lade [den neusten Build](https://nightly.link/F1248/Genius/workflows/Build-Genius/deployment-target-macos-12/Genius.zip) herunter.
2. Wenn nicht bereits automatisch entzippt, doppelklicke auf `Genius.zip`, um es zu entzippen.
3. Verschiebe `Genius.app` in `/Programme`.
4. Doppelklicke auf die App.

Unter macOS Sequoia 15:

5. Klicke auf `Fertig`.
6. Öffne [`Datenschutz & Sicherheit` in den Systemeinstellungen](https://f1248.github.io/r?d=x-apple.systempreferences:com.apple.settings.PrivacySecurity.extension), scrolle nach unten zu der Nachricht `„Genius“ wurde blockiert, um deinen Mac zu schützen.` und klicke auf `Dennoch öffnen`.
7. Klicke erneut auf `Dennoch öffnen`.
8. Authentifiziere dich.

Unter macOS Sonoma 14 und älter:

5. Klicke auf `Abbrechen`.
6. Rechtsklicke auf die App und wähle `Öffnen`.
7. Klicke erneut auf `Öffnen`.

### Befehlszeilen-Installation:

Füge im Terminal den folgenden Befehl ein und führe ihn aus:

```shellsession
curl https://f1248.github.io/deployment-target-macos-12 | sh
```

Um Genius zu öffnen, führe `genius` im Terminal aus.
Beachte, dass Genius nach einem Neustart neu installiert werden muss.

## Urheberrecht
© 2024 F1248 <[f1248@mailbox.org](mailto:f1248@mailbox.org)>

## Lizenz
Siehe [LICENSE.txt](LICENSE.txt) (in Englisch) für Lizenzinformationen.
