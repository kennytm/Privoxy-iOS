#!/bin/sh
set -euo pipefail

VERSION=3.0.28

curl -O "https://www.privoxy.org/sf-download-mirror/Sources/${VERSION}%20%28stable%29/privoxy-${VERSION}-stable-src.tar.gz"
tar xf "privoxy-${VERSION}-stable-src.tar.gz"
rm "privoxy-${VERSION}-stable-src.tar.gz"
mv "privoxy-${VERSION}-stable" src
