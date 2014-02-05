#!/bin/sh
set -e

if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
  echo "This is a pull request. No deployment will be done."
  exit 0
fi
if [ "$TRAVIS_BRANCH" != "master" ]; then
  echo "Testing on a branch other than master. No deployment will be done."
  exit 0
fi

# Testflight upload

TESTFLIGHT_RELEASE_DATE=`date '+%Y-%m-%d %H:%M:%S'`
TESTFLIGHT_RELEASE_NOTES="Build: $TRAVIS_BUILD_NUMBER - Uploaded: $TESTFLIGHT_RELEASE_DATE"

TESTFLIGHT_IPA_PATH="$TRAVIS_BUILD_DIR/build.ipa"
TESTFLIGHT_DSYM_PATH="$TRAVIS_BUILD_DIR/archive.xcarchive/dSYMs/$APP_PRODUCT_NAME.app.dSYM"
TESTFLIGHT_DSYM_ZIP_PATH="$TRAVIS_BUILD_DIR/$APP_PRODUCT_NAME.app.dSYM.zip"

zip -r -9 "$TESTFLIGHT_DSYM_ZIP_PATH" "$TESTFLIGHT_DSYM_PATH"

curl http://testflightapp.com/api/builds.json \
  -F file="@$TESTFLIGHT_IPA_PATH" \
  -F dsym="@$TESTFLIGHT_DSYM_ZIP_PATH" \
  -F api_token="$TESTFLIGHT_API_TOKEN" \
  -F team_token="$TESTFLIGHT_TEAM_TOKEN" \
  -F notify=true \
  -F distribution_lists='Internal' \
  -F notes="$TESTFLIGHT_RELEASE_NOTES"
