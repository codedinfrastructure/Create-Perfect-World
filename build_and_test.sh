#!/usr/bin/env bash
set -x

./build.sh

rm -rf testdata
mkdir testdata -f

docker run --rm \
	--name mc-create-perfect-world \
	-it \
	--entrypoint /bin/bash \
	-e EULA=true -e VERSION=1.20.1 \
	-e DEBUG=true -e TYPE=CURSEFORGE \
	-e CF_SERVER_MOD=/modpacks/Create-Perfect-World-0.4-Server-Files.zip \
	-v ./build/:/modpacks/ \
	-v ./testdata:/data \
	-p 25565:25565 itzg/minecraft-server
	