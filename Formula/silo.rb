class Silo < Formula
  desc "Seafile-compatible server and client in one binary"
  homepage "https://github.com/dkam/silo"
  version "0.2.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/dkam/silo/releases/download/v0.2.0/silo-v0.2.0-darwin-arm64.tar.gz"
      sha256 "5fc8da4066b458e4ca1f6fe8d15378f5ba1ade9e6bf822642a73b27aaeb0da6e"
    end
    on_intel do
      url "https://github.com/dkam/silo/releases/download/v0.2.0/silo-v0.2.0-darwin-amd64.tar.gz"
      sha256 "e6e5dd9dd14577a870dfd6c6d4dd001143435a44db9b59ae0077ba74c078de88"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dkam/silo/releases/download/v0.2.0/silo-v0.2.0-linux-arm64.tar.gz"
      sha256 "15682c569fd1731d072dd4894eb7a8db0c6228a6c3528111efc0402386f30897"
    end
    on_intel do
      url "https://github.com/dkam/silo/releases/download/v0.2.0/silo-v0.2.0-linux-amd64.tar.gz"
      sha256 "49518fc7e0905be91be982ee72db9e31888aea045a2ab4e95044a74cfb2a868f"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/silo version")
  end
end
