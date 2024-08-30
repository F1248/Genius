[Switch to English](README.md)

# Genius: Der intelligente, universelle macOS-Helfer für alle!

## Anforderungen:

### Unterstützte macOS-Versionen
* macOS Ventura 13 und höher, inklusive recoveryOS

### Unterstützte Modelle
* Macs (inklusive offiziell nicht unterstützten), Hackintoshs und virtuelle Maschinen

## Installation:

### Manuelle Installation (in recoveryOS nicht möglich):

1. Lade [den neusten Build](https://nightly.link/F1248/Genius/workflows/Build-Genius/main/Genius.zip) herunter.
2. Wenn nicht bereits automatisch entzippt, doppelklicke auf `Genius.zip`, um es zu entzippen.
3. Verschiebe `Genius.app` in `/Programme`.
4. Doppelklicke auf die App.

Unter macOS Sonoma 14 und älter:

5. Klicke auf `Abbrechen`.
6. Rechtsklicke auf die App und wähle `Öffnen`.
7. Klicke erneut auf `Öffnen`.

Unter macOS Sequoia 15:

5. Klicke auf `Fertig`.
6. Öffne [`Datenschutz & Sicherheit` in den Systemeinstellungen](https://f1248.github.io/r?d=x-apple.systempreferences:com.apple.settings.PrivacySecurity.extension), scrolle zu der Nachricht `„Genius“ wurde blockiert, um deinen Mac zu schützen.` und klicke auf `Dennoch öffnen`.
7. Klicke erneut auf `Dennoch öffnen`.
8. Authentifiziere dich.

### Befehlszeilen-Installation:

Füge den folgenden Befehl im Terminal ein und führe ihn aus. Beachte, dass in recoveryOS Genius durch einen Neustart entfernt wird.

```
curl -L f1248.github.io | sh
```

Um Genius in recoveryOS zu öffnen, führe einfach `Genius` im Terminal aus.
