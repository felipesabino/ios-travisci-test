#!/bin/sh
set -e

echo "Decrypting provisioning profiles..."

openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in $TRAVIS_BUILD_DIR/travis/profile/$BUILD_ENVIRONMENT.mobileprovision.enc -d -a -out $TRAVIS_BUILD_DIR/travis/profile/$BUILD_ENVIRONMENT.mobileprovision

echo "Decrypting certificates..."

openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in $TRAVIS_BUILD_DIR/travis/certs/dist.$BUILD_ENVIRONMENT.cer.enc -d -a -out $TRAVIS_BUILD_DIR/travis/certs/dist.$BUILD_ENVIRONMENT.cer

echo "Decrypting keys..."

openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in $TRAVIS_BUILD_DIR/travis/keys/dist.$BUILD_ENVIRONMENT.p12.enc -d -a -out $TRAVIS_BUILD_DIR/travis/keys/dist.$BUILD_ENVIRONMENT.p12
