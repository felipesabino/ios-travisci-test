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

RELEASE_DATE=`date '+%Y-%m-%d %H:%M:%S'`
RELEASE_NOTES="Build: $TRAVIS_BUILD_NUMBER - Uploaded: $RELEASE_DATE"

zip -r -9 "$TRAVIS_BUILD_DIR/$APP_SCHEMA_BASE_NAME.app.dSYM.zip" . -i "$TRAVIS_BUILD_DIR/archive.xcarchive/dSYMs/$APP_SCHEMA_BASE_NAME.app.dSYM"

curl http://testflightapp.com/api/builds.json \
  -F file="@$TRAVIS_BUILD_DIR/$APP_SCHEMA_BASE_NAME.ipa" \
  -F dsym="@$TRAVIS_BUILD_DIR/$APP_SCHEMA_BASE_NAME.app.dSYM.zip" \
  -F api_token="$TESTFLIGHT_API_TOKEN" \
  -F team_token="$TESTFLIGHT_TEAM_TOKEN" \
  -F notify=true \
  -F distribution_lists='Internal' \
  -F notes="$RELEASE_NOTES"
