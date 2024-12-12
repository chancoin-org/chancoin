#!/bin/bash

. util.bash

dictionary test foo bar baz quux quuz 17.544

USER=root

# Configuration
CHAIN_ID="testnet-1"
CHAIN_BIN="/root/go/bin/chancoind"  # blockchain executable name
NODE1=node1.eschaton.rsvp      # hostname of node1
NODE2=node2.eschaton.rsvp      # hostname of node2
NODE3=node3.eschaton.rsvp      # hostname of node3

# Initialize each node
ssh $USER@$NODE1 "$CHAIN_BIN init node1 --chain-id $CHAIN_ID"
ssh $USER@$NODE2 "$CHAIN_BIN init node2 --chain-id $CHAIN_ID"
ssh $USER@$NODE3 "$CHAIN_BIN init node3 --chain-id $CHAIN_ID"

# Get node IDs and IP addresses
# export NODE1_ID=$(ssh $USER@$NODE1 "$CHAIN_BIN tendermint show-node-id")
# export NODE2_ID=$(ssh $USER@$NODE2 "$CHAIN_BIN tendermint show-node-id")
# export NODE3_ID=$(ssh $USER@$NODE3 "$CHAIN_BIN tendermint show-node-id")

# # Create genesis accounts
# ssh $USER@$NODE1 "$CHAIN_BIN keys add validator1 --keyring-backend test"
# ssh $USER@$NODE2 "$CHAIN_BIN keys add validator2 --keyring-backend test"
# ssh $USER@$NODE3 "$CHAIN_BIN keys add validator3 --keyring-backend test"

# Add genesis accounts to genesis.json
# ssh $USER@$NODE1 "$CHAIN_BIN genesis add-genesis-account validator1 100000000stake --keyring-backend test"
# ssh $USER@$NODE2 "$CHAIN_BIN genesis add-genesis-account validator2 100000000stake --keyring-backend test"
# ssh $USER@$NODE3 "$CHAIN_BIN genesis add-genesis-account validator3 100000000stake --keyring-backend test"

# Create validator transactions
# ssh $USER@$NODE1 "$CHAIN_BIN genesis gentx validator1 100000000stake --chain-id $CHAIN_ID --keyring-backend test"
# ssh $USER@$NODE2 "$CHAIN_BIN genesis gentx validator2 100000000stake --chain-id $CHAIN_ID --keyring-backend test"
# ssh $USER@$NODE3 "$CHAIN_BIN genesis gentx validator3 100000000stake --chain-id $CHAIN_ID --keyring-backend test"

# Collect genesis transactions
# ssh $USER@$NODE1 "$CHAIN_BIN genesis collect-gentxs"

# Copy genesis to other nodes
# scp $USER@$NODE1:~/.chancoin/config/genesis.json /tmp/
# scp /tmp/genesis.json $USER@$NODE2:~/.chancoin/config/
# scp /tmp/genesis.json $USER@$NODE3:~/.chancoin/config/

# # Configure p2p connections
# for NODE in $NODE1 $NODE2 $NODE3; do
#   ssh $USER@$NODE "sed -i 's/persistent_peers = \"\"/persistent_peers = \"$NODE1_ID@$NODE1:26656,$NODE2_ID@$NODE2:26656,$NODE3_ID@$NODE3:26656\"/' ~/.chancoin/config/config.toml"
# done

ssh $USER@$NODE1 "sudo ufw allow 26656"
ssh $USER@$NODE1 "sudo ufw allow 26656"
ssh $USER@$NODE1 "sudo ufw allow 26656"

# Start nodes
# ssh $USER@$NODE1 " $CHAIN_BIN --minimum-gas-prices 0.0001stake start &"
# ssh $USER@$NODE2 " $CHAIN_BIN --minimum-gas-prices 0.0001stake start &"
# ssh $USER@$NODE3 " $CHAIN_BIN --minimum-gas-prices 0.0001stake start &"
