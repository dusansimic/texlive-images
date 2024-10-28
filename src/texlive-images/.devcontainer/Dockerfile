ARG IMAGE_TAG
FROM mcr.microsoft.com/devcontainers/base:ubuntu-${IMAGE_TAG}

ARG TL_VERSION

COPY scripts/install_tl.sh /tmp/
RUN TL_VERSION=${TL_VERSION} bash /tmp/install_tl.sh && rm /tmp/install_tl.sh
ENV PATH="/usr/local/texlive/${TL_VERSION}/bin/x86_64-linux:${PATH}"
