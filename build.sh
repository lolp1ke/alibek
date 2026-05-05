#!/usr/bin/env bash

main() {
  ZOLA_VERSION=0.22.1

  if ! command -v zola &> /dev/null; then
    echo "Installing Zola ${ZOLA_VERSION}..."
    curl -fL https://github.com/getzola/zola/releases/download/v${ZOLA_VERSION}/zola-v${ZOLA_VERSION}-x86_64-unknown-linux-gnu.tar.gz -o zola.tar.gz
    mkdir "${HOME}/.local/zola"
    tar -xf "zola.tar.gz"
    rm "zola.tar.gz"
    rm LICENSE
    rm -rf artifacts
    export PATH="${HOME}/.local/zola:${PATH}"
  else
    echo "Zola already installed, skipping installation..."
  fi

  # Verify installations
  echo "Verifying installations..."
  echo Zola: "$(zola --version)"

  # Build the site
  echo "Building the site..."
  chmod +x ./zola
  sh ./zola build --minify
}

set -euo pipefail
main "$@"
