#!/usr/bin/env bash
set -x
VERSION="0.4"
SERVER_FILE="Create-Perfect-World-${VERSION}-Server-Files.zip"



# rm -rf build
mkdir -p build
# wget https://maven.minecraftforge.net/net/minecraftforge/forge/1.20.1-47.2.0/forge-1.20.1-47.2.0-installer.jar

if [ ! -f build/${SERVER_FILE} ]; then
		wget --show-progress https://mediafilez.forgecdn.net/files/4832/418/Create-Perfect-World-0.4-Server-Files.zip -O build/${SERVER_FILE}
fi

zip -ur --verbose build/"${SERVER_FILE}" install.sh