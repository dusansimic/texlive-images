#!/bin/bash
set -e

TL_VERSION="${1:-TL_VERSION}"

if [ -z "${TL_VERSION}" ]
then
  echo "texlive version not specified!"
  exit 1
fi

apt-get update
apt-get install -y perl curl

pushd /tmp

curl -L -o install-tl.unx.tar.gz https://texlive.info/historic/systems/texlive/${TL_VERSION}/install-tl-unx.tar.gz
zcat < install-tl-unx.tar.gz | tar xf -

pushd install-tl-*

perl ./install-tl -repository ftp://tug.org/historic/systems/texlive/${TL_VERSION}/tlnet-final -no-doc-install -no-src-install -no-interaction

popd

rm -rf texlive.profile install-tl-*

popd
