#!/bin/sh

#
# install.sh
# Genius
#
# © 2024 F1248 <f1248@mailbox.org>
# See LICENSE.txt for license information.
#

PATH="/usr/bin:/bin"
set -e

echo "
Preparing..."
if [ -w /Applications ]; then
	cd /Applications
else
	mkdir -p ~/Applications
	cd ~/Applications
fi

echo "Downloading..."
curl --silent --remote-name --location https://nightly.link/F1248/Genius/workflows/Build-Genius/deployment-target-macOS-14/Genius.zip

echo "Installing..."
unzip -q -o Genius.zip
unzip -q -o Genius.zip
if [ ! -e /System/Library/CoreServices/Finder.app ]; then
	echo "
export PATH=\"${PWD}/Genius.app/Contents/MacOS:\$PATH\"" >> ~/.bash_profile
fi

echo "Cleaning up..."
rm Genius.zip

echo "Opening..."
if [ -e /usr/bin/open ]; then
	open Genius.app
else
	Genius.app/Contents/MacOS/Genius
fi

echo "Done."
