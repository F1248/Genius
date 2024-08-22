#!/bin/sh

/bin/echo "
Preparing..."
if [ ! -e /usr/bin/recoverydiagnose ]; then
   cd /Applications
else
   cd ~
fi

/bin/echo "Downloading..."
/usr/bin/curl --silent --location https://nightly.link/F1248/Genius/workflows/Build-Genius/main/Genius.zip --output Genius.zip

/bin/echo "Installing..."
/usr/bin/unzip -q -o Genius.zip
/usr/bin/unzip -q -o Genius.zip

/bin/echo "Cleaning up..."
/bin/rm Genius.zip

/bin/echo "Opening..."
if [ -e /usr/bin/open ]; then
   /usr/bin/open Genius.app
else
   /bin/echo "
export PATH=\"$HOME/Genius.app/Contents/MacOS:\$PATH\"" >> ~/.bash_profile
   Genius.app/Contents/MacOS/Genius
fi

/bin/echo "Done."
