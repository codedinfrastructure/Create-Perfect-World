#!/usr/bin/env bash
set -x
VERSION="0.4"
SERVER_FILE="Create-Perfect-World-${VERSION}-Server-Files.zip"
EXTRA_MODS="https://mediafilez.forgecdn.net/files/4576/54/CraftControlRCON-forge-1.20-1.0.1.jar"



# rm -rf build
mkdir -p build/mods
# wget https://maven.minecraftforge.net/net/minecraftforge/forge/1.20.1-47.2.0/forge-1.20.1-47.2.0-installer.jar



if [ ! -z "$EXTRA_MODS" ]; then
	for MOD in $EXTRA_MODS; do
		MOD_FILE=$(basename $MOD)
		if [ ! -f build/mods/${MOD_FILE} ]; then
			wget --show-progress $MOD -O build/mods/${MOD_FILE}
		fi
	done
fi

chmod 644 -v build/mods/*

if [ ! -f build/${SERVER_FILE} ]; then
		wget --show-progress https://mediafilez.forgecdn.net/files/4832/418/Create-Perfect-World-0.4-Server-Files.zip -O build/${SERVER_FILE}
fi

cd build
zip -ur --verbose "${SERVER_FILE}" mods/* ../install.sh
cd -