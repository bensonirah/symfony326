#!/usr/bin/ env bash

echo "Run migration"

mkdir -p src/Services

# Run these command to create the folder structure symfony it self
#symfony console make:command
#symfony console make:controller
# Dump dependencies from source
jq '.require' ~/workspace/telma-pos-back/composer.json > pos-cli/dependencies.json
# extract the dependencies to install
jq '. | keys []' pos-cli/dependencies-dev.json | tr -d '"' | sort > pos-cli/dependencies-dev.log
jq '. | keys []' pos-cli/dependencies.json | tr -d '"' | sort > pos-cli/dependencies-to-install.log

# Read dependecies from dependencies-to-install.log then install it one by one

cat pos-cli/dependencies-to-install.log | while read line;do
    composer require $line --dry-run
done

# Read dependencies from dev then install them one by one
cat pos-cli/dependencies-dev.log | while read line;do
    composer require $line --dry-run --dev
done

# Dot env generator from the parameters*.yml files
find ~/workspace/telma-pos-back/app/config -type f | grep parameters_ | xargs -I {} basename {} | sort
