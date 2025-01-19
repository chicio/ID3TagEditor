#!/bin/zsh

#  generate-docs.sh
#  ID3TagEditor
#
#  Created by Fabrizio Duroni on 10.10.18.
#  2020 Fabrizio Duroni.

swift package --allow-writing-to-directory docs \
    generate-documentation --target ID3TagEditor \
    --disable-indexing \
    --transform-for-static-hosting \
    --output-path docs \
    --hosting-base-path ID3TagEditor
