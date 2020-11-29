#!/bin/bash
WD="$(
    cd "$(dirname "$0")"
    pwd -P
)"
RESULT_FOLDER=$WD/result

sudo rm -rf "${RESULT_FOLDER}"

# Build the image
docker build . -t davfs2-builder

# Remove previous container
docker down davfs2-builder
docker rm davfs2-builder

# Start the container
docker run -it --name davfs2-builder \
    -v /etc/localtime:/etc/localtime:ro \
    -v /etc/timezone:/etc/timezone:ro \
    -v $RESULT_FOLDER/:/work/ \
    davfs2-builder /build.sh

printf "Install the softwares by going to the result subfolders and running sudo make install\n
Ensure that you hav the following packages installed : gcc (or build-essential), libssl-dev, libxml2-dev, make\n
Do not forget to create the davfs2 group and user (see Davfs2 INSTALL document).\n"
