#!/bin/zsh

#  generate-docs.sh
#  ID3TagEditor
#
#  Created by Fabrizio Duroni on 10.10.18.
#  2020 Fabrizio Duroni.

jazzy -o docs -c --module ID3TagEditor --xcodebuild-arguments -workspace,ID3TagEditor.xcworkspace,-scheme,"ID3TagEditor iOS" -x USE_SWIFT_RESPONSE_FILE=NO
