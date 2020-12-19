#!/bin/zsh

#  release.sh
#  ID3TagEditor
#
#  Created by Fabrizio Duroni on 19.12.20.
#  2020 Fabrizio Duroni.

VERSION=""

show_help() {
    echo "release - Create a new ID3TagEditor release"
    echo " "
    echo "release [options]"
    echo " "
    echo "options:"
    echo "-h,     show brief help"
    echo "-v,     specify the release version to be created (use semantic versioning)"
}

# Parse params

while getopts ":hv:" opt; do
  case ${opt} in
    h)
      show_help
      exit 0
      ;;
    v)
      VERSION=${OPTARG}
      ;;
    \?)
      echo "Invalid Option: -$OPTARG" 1>&2
      echo " "
      show_help
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

# Check version param

if [ -z "$VERSION" ]
then
   show_help
   exit 1
fi

# Go in root folder

cd ..

# Increment marketing version

echo "Updating version on Xcode project..."
agvtool new-marketing-version $VERSION
echo ""

# Generate doc

echo "Generate docs..."
./Scripts/generate-docs.sh
echo ""


