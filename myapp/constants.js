/*
 Copyright IBM Corp. All Rights Reserved.

 SPDX-License-Identifier: Apache-2.0
*/
var os = require('os');
var path = require('path');

var tempdir = "./client-certs";
//path.join(os.tmpdir(), 'hfc');

// Frame the endorsement policy
var THREE_ORG_MEMBERS_AND_ADMIN = [{
    role: {
        name: 'member',
        mspId: 'UetMSP'
    }
}, {
    role: {
        name: 'member',
        mspId: 'UlisMSP'
    }
}, {
    role: {
        name: 'member',
        mspId: 'UsshMSP'
    }
},  {
    role: {
        name: 'admin',
        mspId: 'OrdererMSP'
    }
}];

var ALL_FOUR_ORG_MEMBERS = {
    identities: THREE_ORG_MEMBERS_AND_ADMIN,
    policy: {
        '3-of': [{'signed-by': 0}, {'signed-by': 1}, {'signed-by': 2}]
    }
};

var ACCEPT_ALL = {
    identities: [],
    policy: {
        '0-of': []
    }
};

var chaincodeLocation = '../chaincode';

var networkId = 'uet-network';

var networkConfig = './config.json';

var networkLocation = '../';

var channelConfig = '../channel-artifacts/channel.tx';

var UET = 'uet';
var ULIS = 'ulis';
var USSH = 'ussh';
var CHANNEL_NAME = 'uetchannel';
var CHAINCODE_PATH = 'chaincode/chaincode_example02/go';
var CHAINCODE_ID = 'uet';
var CHAINCODE_VERSION = 'v0';
var CHAINCODE_UPGRADE_PATH = 'github.com/trade_workflow_v1';
var CHAINCODE_UPGRADE_VERSION = 'v1';

var TRANSACTION_ENDORSEMENT_POLICY = ALL_FOUR_ORG_MEMBERS;

module.exports = {
    tempdir: tempdir,
    chaincodeLocation: chaincodeLocation,
    networkId: networkId,
    networkConfig: networkConfig,
    networkLocation: networkLocation,
    channelConfig: channelConfig,
    UET: UET,
    ULIS: ULIS,
    USSH: USSH,
    CHANNEL_NAME: CHANNEL_NAME,
    CHAINCODE_PATH: CHAINCODE_PATH,
    CHAINCODE_ID: CHAINCODE_ID,
    CHAINCODE_VERSION: CHAINCODE_VERSION,
    CHAINCODE_UPGRADE_PATH: CHAINCODE_UPGRADE_PATH,
    CHAINCODE_UPGRADE_VERSION: CHAINCODE_UPGRADE_VERSION,
    ALL_FOUR_ORG_MEMBERS: ALL_FOUR_ORG_MEMBERS,
    TRANSACTION_ENDORSEMENT_POLICY: TRANSACTION_ENDORSEMENT_POLICY
};
