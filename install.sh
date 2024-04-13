#!/bin/bash

# Create the distination directory
mkdir -p ~/.pos-cli

# copy the source folder into the destination folder

cp -r $(pwd)/* ~/.pos-cli
cp $(pwd)/.env ~/.pos-cli

# Load environment

export $(cat ~/.pos-cli/.env | xargs)

# link source
sudo ln -s ~/.pos-cli/bin/pos.sh /usr/local/bin/pos