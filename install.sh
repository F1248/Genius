#!/bin/sh

/bin/echo "
Preparing..."
if [ -w /Applications ]; then
    cd /Applications
else
    /bin/mkdir -p ~/Applications
    cd ~/Applications
fi

/bin/echo "Downloading..."
/usr/bin/curl --silent --location https://nightly.link/F1248/Genius/workflows/Build-Genius/deployment-target-macOS-12/Genius.zip --output Genius.zip

/bin/echo "Installing..."
/usr/bin/unzip -q -o Genius.zip
/usr/bin/unzip -q -o Genius.zip
if [ ! -e /System/Library/CoreServices/Finder.app ]; then
    /bin/echo "
export PATH=\"$(/bin/pwd)/Genius.app/Contents/MacOS:\$PATH\"" >> ~/.bash_profile
fi

/bin/echo "Cleaning up..."
/bin/rm Genius.zip

/bin/echo "Opening..."
if [ -e /usr/bin/open ]; then
    /usr/bin/open Genius.app
else
    Genius.app/Contents/MacOS/Genius
fi

/bin/echo "Done."
