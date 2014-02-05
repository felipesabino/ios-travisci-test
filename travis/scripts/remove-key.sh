#!/bin/sh
set -e

security delete-keychain ios-build.keychain
rm -f ~/Library/MobileDevice/Provisioning\ Profiles/staging.mobileprovision
rm -f ~/Library/MobileDevice/Provisioning\ Profiles/production.mobileprovision
