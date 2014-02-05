#!/bin/sh
set -e

security delete-keychain ios-build-staging.keychain
security delete-keychain ios-build-production.keychain
rm -f ~/Library/MobileDevice/Provisioning\ Profiles/staging.mobileprovision
rm -f ~/Library/MobileDevice/Provisioning\ Profiles/production.mobileprovision
