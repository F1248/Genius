#
# © 2025 F1248 <f1248@mailbox.org>
# See LICENSE.txt for license information.
#

SHELL = /bin/bash -o pipefail
.PHONY: *

xcodebuild_arguments = -scheme Genius
xcodebuild_test_arguments = -configuration Test-Release
xcodebuild_pipe = \
	| sed "s/warning:/error:/g" \
	| tee xcodebuild.log \
	| $(command_prefix)xcbeautify --disable-logging $(xcbeautify_arguments)

ifeq ($(GITHUB_ACTIONS), true)
	command_prefix = ./
	periphery_arguments = --format github-actions -- -skipPackagePluginValidation
	swiftformat_arguments = --reporter github-actions-log
	swiftlint_arguments = --reporter github-actions-logging
	xcbeautify_arguments = --renderer github-actions
	xcodebuild_arguments += -skipPackagePluginValidation
endif

define evaluate-log
	if grep --quiet "error:" xcodebuild.log; then exit 1; fi
endef

define remove-log
	rm xcodebuild.log
endef

all: lint test-without-building build

lint: periphery swiftformat swiftlint

periphery:
	$(command_prefix)periphery scan --strict $(periphery_arguments)

swiftformat:
	$(command_prefix)swiftformat --lint . $(swiftformat_arguments)

swiftlint: swiftlint-lint swiftlint-analyze

swiftlint-lint:
	$(command_prefix)swiftlint lint --strict $(swiftlint_arguments)

swiftlint-analyze: clean-test-build build-for-testing-keep-log swiftlint-analyze-log-exists

clean-test-build:
	rm -r -f ~/Library/Developer/Xcode/DerivedData/Genius-*/Build/Intermediates.noindex/Genius.build/Test-Release

swiftlint-analyze-log-exists:
	$(command_prefix)swiftlint analyze --strict --compiler-log-path xcodebuild.log $(swiftlint_arguments)
	$(remove-log)

test: build-for-testing test-without-building

build-for-testing: build-for-testing-keep-log
	$(remove-log)

build-for-testing-keep-log:
	# work around warnings `duplicate -rpath '@executable_path' ignored`
	xcodebuild build-for-testing \
		$(xcodebuild_arguments) \
		-destination generic/platform=macOS \
		$(xcodebuild_test_arguments) \
		| grep --invert-match "ld: warning: duplicate -rpath '@executable_path' ignored" \
		$(xcodebuild_pipe)
	$(evaluate-log)

test-without-building:
	xcodebuild test-without-building \
		$(xcodebuild_arguments) \
		-destination platform=macOS,arch=arm64 \
		$(xcodebuild_test_arguments) \
		$(xcodebuild_pipe)
	$(evaluate-log)
	$(remove-log)

build:
	# work around warnings `Users/*/Library/Developer/Xcode/DerivedData/ModuleCache.noindex/*.pcm: No such file or directory`
	xcodebuild archive \
		$(xcodebuild_arguments) \
		-destination generic/platform=macOS \
		-archivePath Genius \
		| grep --invert-match "warning: Users/.*/Library/Developer/Xcode/DerivedData/ModuleCache\.noindex/.*\.pcm: No such file or directory" \
		$(xcodebuild_pipe)
	$(evaluate-log)
	$(remove-log)
	mv Genius.xcarchive/Products/Applications/Genius.app .
	mv Genius.xcarchive/dSYMs/Genius.app.dSYM .
	rm -r Genius.xcarchive

install-files:
	mkdir _site
	cd Genius && eval "$$( \
		git for-each-ref --format=" \
			git checkout %(refname) && \
			sed -i '' 's|/main/|/%(refname:lstrip=-1)/|g' Install && \
			cp Install ../_site/\$$( \
				echo %(refname:lstrip=-1) \
			).html && \
			git reset --hard \
		" "refs/remotes/origin/*" \
	)"
	cd _site && cp main.html index.html
