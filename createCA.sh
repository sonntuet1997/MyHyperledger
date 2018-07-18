#!/usr/bin/env bash
# remove old certificate
rm -r crypto-config
./bin/cryptogen generate --config=./crypto-config.yaml
