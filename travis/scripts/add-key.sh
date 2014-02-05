#!/bin/sh
set -e

echo "Creating keychain..."
security create-keychain -p travis ios-build.keychain

echo "Adding apple certificate..."
security import $PWD/travis/certs/apple.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign

echo "Adding certificates..."
security import $PWD/travis/certs/dist.staging.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import $PWD/travis/certs/dist.production.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign

echo "Adding private keys..."
security import $PWD/travis/certs/dist.staging.p12 -k ~/Library/Keychains/ios-build.keychain -P $KEY_PASSWORD -T /usr/bin/codesign
security import $PWD/travis/certs/dist.production.p12 -k ~/Library/Keychains/ios-build.keychain -P $KEY_PASSWORD -T /usr/bin/codesign

echo "Copying provisioning profiles..."
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp $PWD/travis/profile/staging.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/
cp $PWD/travis/profile/production.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/
