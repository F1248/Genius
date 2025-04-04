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
if [[ -e /usr/bin/osascript ]]; then
	for _ in $(pgrep -x Genius); do
		osascript -e "quit app \"Genius\""
	done
else
	killall -q Genius || true
fi
if [[ -w /Applications ]]; then
	cd /Applications
else
	mkdir -p ~/Applications
	cd ~/Applications
fi

echo "Downloading..."
curl --no-progress-meter --remote-name --location https://nightly.link/F1248/Genius/workflows/Build-Genius/main/Genius.zip

echo "Installing..."
unzip -q -o Genius.zip
rm -r -f Genius.app
unzip -q Genius.zip
if [[ ! -e /System/Library/CoreServices/Finder.app ]]; then
	echo "\nalias genius=\"$PWD/Genius.app/Contents/MacOS/Genius &> /dev/null\"" >> ~/.bash_profile
fi

echo "Cleaning up..."
rm Genius.zip

echo "Opening..."
if [[ -e /usr/bin/open ]]; then
	open Genius.app
else
	Genius.app/Contents/MacOS/Genius &> /dev/null
fi

echo "Done."
