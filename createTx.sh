# remove old certificate=
export FABRIC_CFG_PATH=$PWD
./bin/configtxgen -profile OrdererGenesis -outputBlock ./channel-artifacts/genesis.block

export CHANNEL_NAME=uetchannel
./bin/configtxgen -profile OrgsChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID $CHANNEL_NAME

./bin/configtxgen -profile OrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/UetMSPanchors.tx -channelID $CHANNEL_NAME -asOrg UetMSP
./bin/configtxgen -profile OrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/UlisMSPanchors.tx -channelID $CHANNEL_NAME -asOrg UlisMSP
./bin/configtxgen -profile OrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/UsshMSPanchors.tx -channelID $CHANNEL_NAME -asOrg UsshMSP