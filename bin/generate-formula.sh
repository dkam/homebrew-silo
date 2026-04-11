#!/usr/bin/env bash
#
# Generate the Homebrew formula for silo from the latest GitHub release.
# Usage: ./bin/generate-formula.sh [version]
#   If version is omitted, uses the latest release tag.

set -euo pipefail

REPO="dkam/silo"
VERSION="${1:-}"

if [ -z "$VERSION" ]; then
  VERSION=$(gh release view --repo "$REPO" --json tagName -q '.tagName' | sed 's/^v//')
fi

TAG="v${VERSION}"
BASE_URL="https://github.com/${REPO}/releases/download/${TAG}"

# goos-goarch pairs matching what .github/workflows/build.yml produces
TARGETS=(
  darwin-arm64
  darwin-amd64
  linux-arm64
  linux-amd64
)

declare -A SHAS

echo "Fetching checksums for ${TAG}..." >&2

for target in "${TARGETS[@]}"; do
  asset="silo-${TAG}-${target}.tar.gz"
  # The release ships a .sha256 sidecar for every tarball; grab that
  # instead of re-hashing the tarball itself.
  sha=$(curl -sfL "${BASE_URL}/${asset}.sha256" | awk '{print $1}')
  if [ -z "$sha" ]; then
    echo "  ERROR: failed to fetch sha256 for ${asset}" >&2
    exit 1
  fi
  SHAS[$target]="$sha"
  echo "  ${asset}: ${sha}" >&2
done

cd "$(dirname "$0")/.."
mkdir -p Formula

cat > Formula/silo.rb <<FORMULA
class Silo < Formula
  desc "Seafile-compatible server and client in one binary"
  homepage "https://github.com/${REPO}"
  version "${VERSION}"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "${BASE_URL}/silo-${TAG}-darwin-arm64.tar.gz"
      sha256 "${SHAS[darwin-arm64]}"
    end
    on_intel do
      url "${BASE_URL}/silo-${TAG}-darwin-amd64.tar.gz"
      sha256 "${SHAS[darwin-amd64]}"
    end
  end

  on_linux do
    on_arm do
      url "${BASE_URL}/silo-${TAG}-linux-arm64.tar.gz"
      sha256 "${SHAS[linux-arm64]}"
    end
    on_intel do
      url "${BASE_URL}/silo-${TAG}-linux-amd64.tar.gz"
      sha256 "${SHAS[linux-amd64]}"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/silo version")
  end
end
FORMULA

echo "Generated Formula/silo.rb (${TAG})" >&2
