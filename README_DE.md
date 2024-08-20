[Switch to English](README.md)

# OpenMacHelper: Der Universal-Helfer für macOS!

## Anforderungen:

### Unterstützte macOS-Versionen
* macOS Big Sur 11 und höher, inklusive recoveryOS

### Unterstützte Modelle
* Macs (inklusive offiziell nicht unterstützten), Hackintoshs und virtuelle Maschinen

## Installation:

### Manuelle Installation (in recoveryOS nicht möglich):

1. Lade [den neusten Build](https://nightly.link/F1248/OpenMacHelper/workflows/Build-OpenMacHelper/main/OpenMacHelper.zip) herunter.
2. Wenn nicht bereits automatisch entzippt, entzippe `OpenMacHelper.zip`.
3. Verschiebe `OpenMacHelper.app` in `/Programme`.
4. Doppelklicke auf die App.

Unter macOS Sequoia 15:

5. Klicke auf `Fertig`.
6. Öffne [`Datenschutz & Sicherheit`](x-apple.systempreferences:com.apple.settings.PrivacySecurity.extension) in den Systemeinstellungen, scrolle zu der Nachricht `„OpenMacHelper“ wurde blockiert, um deinen Mac zu schützen.` und klicke auf `Dennoch öffnen`.
7. Klicke erneut auf `Dennoch öffnen`.
8. Authentifiziere dich.

Unter macOS Sonoma 14 und älter:

5. Klicke auf `Abbrechen`.
6. Rechtsklicke auf die App und wähle `Öffnen`.
7. Klicke erneut auf `Öffnen`.

### Befehlszeilen-Installation:

Füge den folgenden Befehl im Terminal ein und führe ihn aus. Beachte, dass in recoveryOS OpenMacHelper durch einen Neustart entfernt wird.

`curl -L f1248.github.io | sh`

Um OpenMacHelper in recoveryOS zu öffnen, führe einfach `OpenMacHelper` im Terminal aus.
