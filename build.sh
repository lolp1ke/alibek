#!/usr/bin/env bash
main() {
  ZOLA_VERSION=0.22.1

  echo "Installing zola v${ZOLA_VERSION}..."
  curl -fL https://github.com/getzola/zola/releases/download/v${ZOLA_VERSION}/zola-v${ZOLA_VERSION}-x86_64-unknown-linux-gnu.tar.gz -o zola.tar.gz
  
  tar -xf zola.tar.gz
  cp zola /opt/buildhome

  rm LICENSE zola.tar.gz
  rm -rf artifacts

  echo "Verifying installations..."
  echo Zola: "$(zola --version)"
  
  # https://gohugo.io/methods/page/gitinfo/#hosting-considerations
  # git fetch --recurse-submodules --unshallow

  echo "Initializing git submodules..."
  git submodule update --init --recursive

  # Build the site!
  zola build
}

set -euo pipefail
main "$@"
