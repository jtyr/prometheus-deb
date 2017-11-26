#!/bin/bash

set -e

NAME=${TRAVIS_TAG%%-*}
VER=${TRAVIS_TAG##$NAME-}
VER_REL=${VER%%-*}
VER_REV=${VER##*-}

if [ -z "$NAME" ]; then
    echo "Cannot extract name from the tag '$TRAVIS_TAG'."
    exit 1
fi
if [ -z "$VER" ]; then
    echo "Cannot extract full version from the tag '$TRAVIS_TAG'."
    exit 1
fi
if [ -z "$VER_REL" ]; then
    echo "Cannot extract release version from the tag '$TRAVIS_TAG'."
    exit 1
fi
if [ -z "$VER_REV" ]; then
    echo "Cannot extract revision version from the tag '$TRAVIS_TAG'."
    exit 1
fi

echo "NAME=$NAME; VER=$VER; REL=$VER_REL; REV=$VER_REV"

TMP='/tmp/prometheus/'
rm -fr "$TMP"
mkdir -p "$TMP"

cd "$TRAVIS_BUILD_DIR/$NAME"

curl -OL https://github.com/prometheus/$NAME/releases/download/v$VER_REL/$NAME-$VER_REL.linux-amd64.tar.gz
tar -xvzf $NAME-$VER_REL.linux-amd64.tar.gz
mv $NAME-$VER_REL.linux-amd64 $NAME

m4 -DNAME="$NAME" -DVER="$VER" -DDATE="$(date '+%a, %d %b %Y %H:%M:%S %z')" debian/changelog.m4 > debian/changelog
dpkg-buildpackage -tc -b -kCA67951CD2BBE8AAE4210B72FB90C91F64BED28C

mv "$TRAVIS_BUILD_DIR"/*.deb $TMP
