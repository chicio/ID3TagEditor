#!/bin/zsh

#  cocoapods.sh
#  ID3TagEditor
#
#  Created by Fabrizio Duroni on 08/03/25.
#  Copyright © 2025 Fabrizio Duroni. All rights reserved.

# Publish release on cocoapods

echo "Publish release on cocoapods..."

pod lib lint

pod trunk push ID3TagEditor.podspec

