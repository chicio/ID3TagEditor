#!/bin/zsh

#  cocoapods.sh
#  ID3TagEditor
#
#  Created by Fabrizio Duroni on 08/03/25.
#  Copyright © 2025 Fabrizio Duroni. All rights reserved.

# Get root folder of the Git repository

GIT_ROOT=$(git rev-parse --show-toplevel)
cd "$GIT_ROOT" || { echo "Failed to change directory to project root."; exit 1; }

# Publish release on cocoapods

echo "Publish release on cocoapods..."

pod lib lint

pod trunk push ID3TagEditor.podspec

