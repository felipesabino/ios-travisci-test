#!/bin/sh
set -e

security delete-keychain ios-build.keychain
rm -f ~/Library/MobileDevice/Provisioning\ Profiles/$BUILD_ENVIRONMENT.mobileprovision
