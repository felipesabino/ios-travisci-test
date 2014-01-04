#!/bin/sh
set -e

openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in ./travis/profile/$PROFILE_NAME.mobileprovision.enc -d -a -out ./travis/profile/$PROFILE_NAME.mobileprovision
openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in ./travis/certs/dist.cer.p12 -d -a -out ./travis/certs/dist.p12
openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in ./travis/certs/dist.cer.enc -d -a -out ./travis/certs/dist.cer
