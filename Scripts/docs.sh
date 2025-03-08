#!/bin/zsh

#  docs.sh
#  ID3TagEditor
#
#  Created by Fabrizio Duroni on 10.10.18.
#  2020 Fabrizio Duroni.

# Get root folder of the Git repository

GIT_ROOT=$(git rev-parse --show-toplevel)
cd "$GIT_ROOT" || { echo "Failed to change directory to project root."; exit 1; }

echo "Generating docs..."

swift package --allow-writing-to-directory docs \
    generate-documentation --target ID3TagEditor \
    --disable-indexing \
    --transform-for-static-hosting \
    --output-path docs \
    --hosting-base-path ID3TagEditor

echo "Push docs..."

git add .

git commit -m "Updated docs :bulb:"

git push
