#!/bin/sh

if [[ "$(uname -m)" == arm64 ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

# Type a script or drag a script file from your workspace to insert its path.
if which swiftlint >/dev/null; then
  swiftlint lint --config .swiftlint.yml
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
