#!/bin/sh
set -e

xctool -workspace TravisCiIntegration.xcworkspace -scheme TravisCiIntegration -sdk iphoneos -configuration Release OBJROOT=$PWD/build SYMROOT=$PWD/build ONLY_ACTIVE_ARCH=NO
