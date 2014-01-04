#!/bin/sh
set -e

openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in ./travis/profile/Taqtile_Travis_Test_Adhoc.mobileprovision.enc -d -a -out ./travis/profile/Taqtile_Travis_Test_Adhoc.mobileprovision
openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in ./travis/certs/dist.p12.cer -d -a -out ./travis/certs/dist.p12
openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in ./travis/certs/dist.cer.enc -d -a -out ./travis/certs/dist.cer
