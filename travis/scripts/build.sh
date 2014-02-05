#!/bin/sh
set -e

echo "Usgin 'xcodebuild' instead of 'xctool' beacuse of https://github.com/facebook/xctool/issues/242"


echo "Archiving $BUILD_ENVIRONMENT..."

xcodebuild -verbose -workspace $APP_WORKSPACE_FILE_NAME.xcworkspace -scheme "$APP_SCHEMA_BASE_NAME-$BUILD_ENVIRONMENT" -sdk iphoneos -configuration "Release-$BUILD_ENVIRONMENT" -archivePath $BUILD_PATH/archive.xcarchive archive

echo "Generating $BUILD_ENVIRONMENT IPA file..."

xcodebuild -verbose -exportArchive -exportFormat ipa -archivePath $BUILD_PATH/archive.xcarchive -exportPath $BUILD_PATH/build.ipa -exportProvisioningProfile "$PROFILE_NAME"
