#!/bin/sh

# Test

/bin/echo "
Preparing..."
cd /Applications

/bin/echo "Downloading..."
/usr/bin/curl --silent --location https://nightly.link/F1248/OpenMacHelper/workflows/Build-OpenMacHelper/main/OpenMacHelper.zip --output OpenMacHelper.zip

/bin/echo "Installing..."
/usr/bin/unzip -q -o OpenMacHelper.zip
/usr/bin/unzip -q -o OpenMacHelper.zip

/bin/echo "Cleaning up..."
/bin/rm OpenMacHelper.zip

/bin/echo "Done."
