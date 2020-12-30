#!/bin/zsh

#  generate-docs.sh
#  ID3TagEditor
#
#  Created by Fabrizio Duroni on 10.10.18.
#  2020 Fabrizio Duroni.

jazzy \
  --output docs \
  --module ID3TagEditor \
  --xcodebuild-arguments -workspace,ID3TagEditor.xcworkspace,-scheme,"ID3TagEditor iOS" -x USE_SWIFT_RESPONSE_FILE=NO \
  --author_url https://www.fabrizioduroni.it \
  --github_url https://github.com/chicio/ID3TagEditor \
  --copyright "2020 [Fabrizio Duroni](https://www.fabrizioduroni.it)"
