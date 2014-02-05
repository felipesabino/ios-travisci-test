#!/bin/sh
set -e

if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
  echo "This is a pull request. No Testflight deployment will be done."
  exit 0
fi
if [ "$TRAVIS_BRANCH" != "$TESTFLIGHT_DISTRIBUTION_BRANCH" ]; then
  echo "Testing on a branch other than $TESTFLIGHT_DISTRIBUTION_BRANCH. No Testflight deployment will be done."
  exit 0
fi
if [ "$BUILD_ENVIRONMENT" != "$TESTFLIGHT_BUILD_ENVIRONMENT" ]; then
  echo "Not building $TESTFLIGHT_BUILD_ENVIRONMENT environment. Not Testflight deployment will be done."
  exit 0
fi

# Testflight upload

TESTFLIGHT_RELEASE_DATE=`date '+%Y-%m-%d %H:%M:%S'`
TESTFLIGHT_RELEASE_NOTES="Build: $TRAVIS_BUILD_NUMBER - Uploaded: $TESTFLIGHT_RELEASE_DATE"

TESTFLIGHT_IPA_PATH="$BUILD_PATH/build.ipa"
TESTFLIGHT_DSYM_PATH="$BUILD_PATH/archive.xcarchive/dSYMs/$APP_PRODUCT_NAME.app.dSYM"
TESTFLIGHT_DSYM_ZIP_PATH="$BUILD_PATH/$APP_PRODUCT_NAME.app.dSYM.zip"

zip -r -9 "$TESTFLIGHT_DSYM_ZIP_PATH" "$TESTFLIGHT_DSYM_PATH"

curl http://testflightapp.com/api/builds.json \
  -F file="@$TESTFLIGHT_IPA_PATH" \
  -F dsym="@$TESTFLIGHT_DSYM_ZIP_PATH" \
  -F api_token="$TESTFLIGHT_API_TOKEN" \
  -F team_token="$TESTFLIGHT_TEAM_TOKEN" \
  -F notify=true \
  -F distribution_lists="$TESTFLIGHT_DISTRIBUTION_LIST" \
  -F notes="$TESTFLIGHT_RELEASE_NOTES"
