#!/bin/bash

# Get the script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo $SCRIPT_DIR

cd $SCRIPT_DIR/../helm-charts

pwd

# Create the release bundles
helm package omg-shoes
helm package ztp-as-a-service

# Move them
mv *.tgz ../docs/chart-repo

# Create the index.yaml file
cd ../docs/
helm repo index chart-repo --url https://gskumar1010.github.io/multiverse-of-multicluster-madness/chart-repo/
#helm repo index chart-repo --merge --url https://gskumar1010.github.io/multiverse-of-multicluster-madness/chart-repo/

# helm repo add kemo-mvmcm https://gskumar1010.github.io/multiverse-of-multicluster-madness/chart-repo/