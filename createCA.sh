# remove old certificate
rm -r crypto-config
./bin/cryptogen generate --config=./crypto-config.yaml
