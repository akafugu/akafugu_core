#/bin/bash

greadlink --help  >/dev/null 2>&1 || { echo >&2 "greadline is needed. Please install via homebrew \"brew install coreutils\".  Aborting."; exit 1; }

if [ $# -eq 0 ]
  then
    echo "Usage: $(basename $0) [version]"
    exit 1
fi

SCRIPT_PATH=$(greadlink -f $(dirname "$0"))
SRC_PATH=$(greadlink -f ${SCRIPT_PATH}/../src)

VERSION=$1
FILENAME=akafugu-${VERSION}.tar.bz2

if [ -e  ${SRC_PATH}/../output/${FILENAME} ]
  then
  	echo "File ${FILENAME} alread exist. Aborting."
  	exit 1
fi

cd ${SRC_PATH}
mkdir ../output
tar -jcf ../output/${FILENAME} .
cd ../output
shasum -a 256 ${FILENAME}
ls -l ${FILENAME}

echo "Done"