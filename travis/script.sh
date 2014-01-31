#!/bin/sh
set -e

if [[ "$BREAK" == "true" ]]; then
  echo "BREAKING THIS BUILD TO TEST BUILD MATRIX SUCCESS CALLBACK"
  exit 1
fi

xctool -workspace TravisCiIntegration.xcworkspace -scheme TravisCiIntegration -sdk iphoneos -configuration Release OBJROOT=$PWD/build SYMROOT=$PWD/build ONLY_ACTIVE_ARCH=NO

echo "Testing archive..."

xctool -workspace TravisCiIntegration.xcworkspace -scheme TravisCiIntegration -sdk iphoneos -configuration Release OBJROOT=$PWD/build SYMROOT=$PWD/build ONLY_ACTIVE_ARCH=NO archive

echo "--> ls -la $PWD/build"

ls -la $PWD/build

echo "zipping archive"

find ~/Library/Developer/Xcode/Archives -type d -Btime -50m -name '*.xcarchive' | head -n 1 | xargs -0 -J {} zip -r -9 build/archive.zip {}


echo "ls -la ./build"

ls -la ./build
