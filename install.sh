#!/usr/bin/env bash
set -e
echo << EOF
 _________________________
< installing forge server >
 -------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\/
                ||----w |
                ||     ||
EOF


ls /modpacks -larth

: "${FORGE_VERSION:=${FORGEVERSION:-RECOMMENDED}}"
: "${FORGE_FORCE_REINSTALL:=false}}"

# shellcheck source=start-utils
. "/start-utils"
isDebugging && set -x

_FORGE_VERSION="1.20.1-47.2.0"

wget https://maven.minecraftforge.net/net/minecraftforge/forge/${_FORGE_VERSION}/forge-${_FORGE_VERSION}-installer.jar -o forge-installer.jar

TEMPDIR=$(mktemp -d)
trap "rm -rf '$TEMPDIR'" EXIT

java -jar forge-installer.jar --installServer $TEMPDIR || java -jar /modpacks/forge-${_FORGE_VERSION}-installer.jar --installServer $TEMPDIR || java -jar /modpacks/forge-installer-${_FORGE_VERSION}.jar --installServer $TEMPDIR

cp -v --no-clobber -r $TEMPDIR/* .

cat > .run-forge.env <<EOF
SERVER="run.sh"
FAMILY="FORGE"
VERSION="$FORGE_VERSION"
TYPE="FORGE"
EOF

set -a
source $PWD/.run-forge.env
set +a

