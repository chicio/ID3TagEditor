#!/bin/sh

#  swift-docker.sh
#  ID3TagEditor
#
#  Created by Fabrizio Duroni on 12.10.2024.
#  2024 Fabrizio Duroni.

docker run --rm --privileged \
        --interactive --tty \
        --name swift-latest \
        --volume "$(pwd):/ID3TagEditor" \
        --workdir "/ID3TagEditor" \
        swift:latest /bin/bash
