#!/bin/sh
set -e

echo "Usgin 'xcodebuild' instead of 'xctool' beacuse of https://github.com/facebook/xctool/issues/242"


echo "Archiving Production..."

xcodebuild -verbose -workspace $APP_WORKSPACE_FILE_NAME.xcworkspace -scheme $APP_SCHEMA_BASE_NAME -sdk iphoneos -configuration Release-Production -archivePath $PWD/archive.production.xcarchive archive

echo "Generating Production IPA file..."

xcodebuild -verbose -exportArchive -exportFormat ipa -archivePath $PWD/archive.production.xcarchive -exportPath $PWD/build.production.ipa -exportProvisioningProfile "$PROFILE_NAME"

