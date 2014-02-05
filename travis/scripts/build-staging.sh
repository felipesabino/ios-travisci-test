#!/bin/sh
set -e

echo "Usgin 'xcodebuild' instead of 'xctool' beacuse of https://github.com/facebook/xctool/issues/242"


echo "Archiving Staging..."

xcodebuild -verbose -workspace $APP_WORKSPACE_FILE_NAME.xcworkspace -scheme $APP_SCHEMA_BASE_NAME -sdk iphoneos -configuration Release-Staging -archivePath $PWD/archive.staging.xcarchive archive

echo "Generating Staging IPA file..."

xcodebuild -verbose -exportArchive -exportFormat ipa -archivePath $PWD/archive.staging.xcarchive -exportPath $PWD/build.staging.ipa -exportProvisioningProfile "$PROFILE_NAME"
