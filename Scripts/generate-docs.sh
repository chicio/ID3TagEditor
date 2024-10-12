#!/bin/zsh

#  generate-docs.sh
#  ID3TagEditor
#
#  Created by Fabrizio Duroni on 10.10.18.
#  2020 Fabrizio Duroni.

jazzy \
  --output docs \
  --module ID3TagEditor \
  --build-tool-arguments -workspace,ID3TagEditor.xcworkspace,-scheme,"ID3TagEditor iOS",-arch,arm64 \
  --author_url https://www.fabrizioduroni.it \
  --github_url https://github.com/chicio/ID3TagEditor \
  --copyright "2024 [Fabrizio Duroni](https://www.fabrizioduroni.it)"
