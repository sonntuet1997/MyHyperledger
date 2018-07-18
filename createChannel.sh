#!/usr/bin/env bash
docker exec -it cli bash
export CHANNEL_NAME=uetchannel
export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/vnu.edu.vn/orderers/orderer.vnu.edu.vn/msp/tlscacerts/tlsca.vnu.edu.vn-cert.pem
peer channel create -o orderer.vnu.edu.vn:7050 -c $CHANNEL_NAME -f ./channel-artifacts/channel.tx --tls --cafile $ORDERER_CA
peer channel join -b uetchannel.block

CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ussh.vnu.edu.vn/users/Admin@ussh.vnu.edu.vn/msp
CORE_PEER_ADDRESS=peer1.ussh.vnu.edu.vn:7051
CORE_PEER_LOCALMSPID="UsshMSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ussh.vnu.edu.vn/peers/peer1.ussh.vnu.edu.vn/tls/ca.crt
peer channel join -b uetchannel.block

CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ulis.vnu.edu.vn/users/Admin@ulis.vnu.edu.vn/msp
CORE_PEER_ADDRESS=peer0.ulis.vnu.edu.vn:7051
CORE_PEER_LOCALMSPID="UlisMSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ulis.vnu.edu.vn/peers/peer0.ulis.vnu.edu.vn/tls/ca.crt
peer channel join -b uetchannel.block

peer chaincode install -n uet1 -v 1.0 -l node -p /opt/gopath/src/github.com/chaincode/chaincode_example02/node/
peer chaincode instantiate -o orderer.vnu.edu.vn:7050 --tls true --cafile $ORDERER_CA -C $CHANNEL_NAME -n uet1 -l node -v 1.0 -c '{"Args":["init","a", "100", "b","200"]}' -P "AND ('UetMSP.peer','UsshMSP.peer','UlisMSP.peer')"
peer chaincode query -C $CHANNEL_NAME -n uet -c '{"Args":["query","a"]}'
peer chaincode invoke -o orderer.vnu.edu.vn:7050 --tls true --cafile $ORDERER_CA -C $CHANNEL_NAME -n uet --peerAddresses peer0.uet.vnu.edu.vn:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/uet.vnu.edu.vn/peers/peer0.uet.vnu.edu.vn/tls/ca.crt --peerAddresses peer0.ussh.vnu.edu.vn:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ussh.vnu.edu.vn/peers/peer0.ussh.vnu.edu.vn/tls/ca.crt /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ulis.vnu.edu.vn/peers/peer0.ulis.vnu.edu.vn/tls/ca.crt -c '{"Args":["invoke","a","b","10"]}'
peer chaincode instantiate -o orderer.vnu.edu.vn:7050 --tls true --cafile $ORDERER_CA -C $CHANNEL_NAME -n test1 -v 1.0 -c '{"Args":["init","a", "100", "b","200"]}' -P "AND ('UetMSP.peer','UsshMSP.peer', 'UlisMSP.peer')"


peer chaincode install -n test1 -v 1.0 -p github.com/chaincode/chaincode_example02/go/
peer chaincode invoke -o orderer.vnu.edu.vn:7050 --tls true --cafile $ORDERER_CA -C $CHANNEL_NAME -n uet -c '{"Args":["invoke","a","b","10"]}'
peer chaincode invoke -o orderer.vnu.edu.vn:7050 --tls trueafile $ORDERER_CA -C $CHANNEL_NAME -n test1 --peerAddresses peer0.uet.vnu.edu.vn:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/uet.vnu.edu.vn/peers/peer0.uet.vnu.edu.vn/tls/ca.crt --peerAddresses peer0.ussh.vnu.edu.vn:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ussh.vnu.edu.vn/peers/peer0.ussh.vnu.edu.vn/tls/ca.crt -c '{"Args":["invoke","a","b","10"]}'
peer chaincode invoke -o orderer.vnu.edu.vn:7050 --tls true --c
--cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/vnu.edu.vn/orderers/orderer.vnu.edu.vn/msp/tlscacerts/tlsca.vnu.edu.vn-cert.pem
-C $CHANNEL_NAME
-n mycc
--peerAddresses peer0.org1.vnu.edu.vn:7051
--tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.vnu.edu.vn/peers/peer0.org1.vnu.edu.vn/tls/ca.crt
--peerAddresses peer0.org2.vnu.edu.vn:7051
--tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.vnu.edu.vn/peers/peer0.org2.vnu.edu.vn/tls/ca.crt
-c '{"Args":["invoke","a","b","10"]}'


export CC_NAME=uet

peer chaincode install -n uet3 -v 1.0 -l node -p /opt/gopath/src/github.com/chaincode/chaincode_example02/node/
peer chaincode instantiate -o orderer.vnu.edu.vn:7050 --tls true --cafile $ORDERER_CA -C $CHANNEL_NAME -n uet3 -l node -v 1.0 -c '{"Args":["init","a", "100", "b","200"]}' -P "AND ('UetMSP.peer','UsshMSP.peer','UlisMSP.peer')"
peer chaincode invoke -o orderer.vnu.edu.vn:7050 --tls true --cafile $ORDERER_CA -C $CHANNEL_NAME -n uet --peerAddresses peer0.uet.vnu.edu.vn:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/uet.vnu.edu.vn/peers/peer0.uet.vnu.edu.vn/tls/ca.crt --peerAddresses peer0.ulis.vnu.edu.vn:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ulis.vnu.edu.vn/peers/peer0.ulis.vnu.edu.vn/tls/ca.crt --peerAddresses peer0.ussh.vnu.edu.vn:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ussh.vnu.edu.vn/peers/peer0.ussh.vnu.edu.vn/tls/ca.crt -c '{"Args":["invoke","a","b","10"]}'
peer chaincode query -C $CHANNEL_NAME -n uet -c '{"Args

":["query","a"]}'
--peerAddresses peer0.uet.vnu.edu.vn:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/uet.vnu.edu.vn/peers/peer0.uet.vnu.edu.vn/tls/ca.crt

{"height":36,"currentBlockHash":"rXO1dmXVIMPMoHKA7uZYTzAaml03rY2mVtO+HcAHhm0=","previousBlockHash":"70Nad91qeK5lTr7dHnJr9fQ1aoXe2B56OaPhdloMlC0="}

Blockchain info: {"height":37,"currentBlockHash":"O6jWjB0zwYdclwQex7oHsnAiMTFmjjfoPJny/O1PEaM=","previousBlockHash":"rXO1dmXVIMPMoHKA7uZYTzAaml03rY2mVtO+HcAHhm0="}



docker rm -f $(docker ps -aq)
docker network prune
awk 'NF {sub(/\r/, ""); printf "%s\\n",$0;}' crypto-config/peerOrganizations/uet.vnu.edu.vn/peers/peer0.uet.vnu.edu.vn/tls/ca.crt
peer channel fetch 0 uetchannel.block -o orderer.example.com:7050 -c $CHANNEL_NAME --tls --cafile $ORDERER_CA