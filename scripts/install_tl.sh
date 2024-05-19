#!/bin/bash
set -e

TL_VERSION="${1:-${TL_VERSION}}"
TL_REPO_URL="ftp://tug.org/texlive/tlnet/tlpkg/texlive.tlpdb"
if [ "$TL_VERSION" -lt "2024" ]; then
  TL_REPO_URL="ftp://tug.org/historic/systems/texlive/${TL_VERSION}/tlnet-final"
fi

if [ -z "${TL_VERSION}" ]
then
  echo "texlive version not specified!"
  exit 1
fi

apt-get update
apt-get install -y perl curl

echo "Downloading TeXLive ${TL_VERSION}..."

cd /tmp

curl -L -o install-tl-unx.tar.gz https://texlive.info/historic/systems/texlive/${TL_VERSION}/install-tl-unx.tar.gz
mkdir tl
tar -xzf install-tl-unx.tar.gz -C tl --strip-components=1

cd /tmp/tl

perl ./install-tl -repository "${TL_REPO_URL}" -no-doc-install -no-src-install -no-interaction

cd /tmp

rm -rf texlive.profile tl
