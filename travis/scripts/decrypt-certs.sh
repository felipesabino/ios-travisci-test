#!/bin/sh
set -e

echo "Decrypting provisioning profiles..."

openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in $PWD/travis/profile/staging.mobileprovision.enc -d -a -out $PWD/travis/profile/staging.mobileprovision
openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in $PWD/travis/profile/production.mobileprovision.enc -d -a -out $PWD/travis/profile/production.mobileprovision

echo "Decrypting certificates..."

openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in $PWD/travis/certs/dist.staging.cer.enc -d -a -out $PWD/travis/certs/dist.staging.cer
openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in $PWD/travis/certs/dist.production.cer.enc -d -a -out $PWD/travis/certs/dist.production.cer

echo "Decrypting keys..."

openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in $PWD/travis/keys/dist.staging.p12.enc -d -a -out $PWD/travis/keys/dist.staging.p12
openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in $PWD/travis/keys/dist.production.p12.enc -d -a -out $PWD/travis/keys/dist.production.p12
