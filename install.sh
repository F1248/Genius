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

is_recoveryos=$([[ ! -e /System/Library/CoreServices/Finder.app ]] && echo true || echo false)

if $is_recoveryos; then
	echo "\nNote: Genius only remains installed until restarting."
fi

echo "\nPreparing..."
if $is_recoveryos; then
	killall -q Genius || true
else
	for _ in $(pgrep -x Genius); do
		osascript -e "quit app \"Genius\""
	done
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
if $is_recoveryos; then
	echo "\nalias genius=\"$PWD/Genius.app/Contents/MacOS/Genius &> /dev/null\"" >> ~/.bash_profile
fi

echo "Cleaning up..."
rm Genius.zip

echo "Opening..."
if $is_recoveryos; then
	Genius.app/Contents/MacOS/Genius &> /dev/null
	echo "\nNote: To reopen Genius run \`genius\` in a new shell.\n"
else
	open Genius.app
fi

echo "Done."
