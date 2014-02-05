#!/bin/sh
set -e

echo "Creating keychains..."
security create-keychain -p travis ios-build.keychain

echo "Adding apple certificate..."
security import $PWD/travis/certs/apple.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign

echo "Adding certificates..."
security import $PWD/travis/certs/dist.$BUILD_ENVIRONMENT.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign

echo "Adding private keys..."
security import $PWD/travis/keys/dist.$BUILD_ENVIRONMENT.p12 -k ~/Library/Keychains/ios-build.keychain -P $KEY_PASSWORD -T /usr/bin/codesign

echo "Copying provisioning profiles..."
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp $PWD/travis/profile/$BUILD_ENVIRONMENT.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/
