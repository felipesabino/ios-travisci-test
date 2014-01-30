#!/bin/sh
set -e

if [[ "$BREAK" == "true" ]]; then
  echo "BREAKING THIS BUILD TO TEST BUILD MATRIX SUCCESS CALLBACK"
  exit 1
fi

xctool -workspace TravisCiIntegration.xcworkspace -scheme TravisCiIntegration -sdk iphoneos -configuration Release OBJROOT=$PWD/build SYMROOT=$PWD/build ONLY_ACTIVE_ARCH=NO

echo "Testing archive..."

xctool -workspace TravisCiIntegration.xcworkspace -scheme TravisCiIntegration -sdk iphoneos -configuration Release OBJROOT=$PWD/build SYMROOT=$PWD/build ONLY_ACTIVE_ARCH=NO archive

echo "--> ls -la $PWD"

ls -la $PWD
