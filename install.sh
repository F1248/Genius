#!/bin/sh

/bin/echo "
Preparing..."
if [ ! -e /usr/bin/recoverydiagnose ]; then
   cd /Applications
fi

/bin/echo "Downloading..."
/usr/bin/curl --silent --location https://nightly.link/F1248/OpenMacHelper/workflows/Build-OpenMacHelper/main/OpenMacHelper.zip --output OpenMacHelper.zip

/bin/echo "Installing..."
/usr/bin/unzip -q -o OpenMacHelper.zip
/usr/bin/unzip -q -o OpenMacHelper.zip

/bin/echo "Cleaning up..."
/bin/rm OpenMacHelper.zip

/bin/echo "Opening..."
if [ -e /usr/bin/open ]; then
   /usr/bin/open OpenMacHelper.app
else
   OpenMacHelper.app/Contents/MacOS/OpenMacHelper
fi

/bin/echo "Done."
