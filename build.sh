#!/usr/bin/env bash
set -euo pipefail

ZOLA_VERSION="0.22.1"
URL="https://github.com/getzola/zola/releases/download/v${ZOLA_VERSION}/zola-v${ZOLA_VERSION}-x86_64-unknown-linux-gnu.tar.gz"

echo "Downloading Zola..."
curl -fL "$URL" -o zola.tar.gz

echo "Inspecting archive..."
tar -tf zola.tar.gz

echo "Extracting..."
tar -xzf zola.tar.gz

chmod +x ./zola

echo "Binary check:"
file ./zola || true

echo "Building site..."
./zola build --output-dir public
