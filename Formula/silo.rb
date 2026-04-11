class Silo < Formula
  desc "Seafile-compatible server and client in one binary"
  homepage "https://github.com/dkam/silo"
  version "0.1.2"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/dkam/silo/releases/download/v0.1.2/silo-v0.1.2-darwin-arm64.tar.gz"
      sha256 "045740a5db74e00c3663fe775da1ed04c1e2175c090b3a953c18fad1035565aa"
    end
    on_intel do
      url "https://github.com/dkam/silo/releases/download/v0.1.2/silo-v0.1.2-darwin-amd64.tar.gz"
      sha256 "ab5abba7148d3de4141de29562d3a8016ba7af24d2b19744dc983bb3b4f54aca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dkam/silo/releases/download/v0.1.2/silo-v0.1.2-linux-arm64.tar.gz"
      sha256 "3b174865fb82dca60e772020dbb3e5a9150e18f1f6c6c658bcddfd74cb1fbbf2"
    end
    on_intel do
      url "https://github.com/dkam/silo/releases/download/v0.1.2/silo-v0.1.2-linux-amd64.tar.gz"
      sha256 "2ba7996882d5c54101887f61f86d3a23f858d8b18730f6478557e87c4f529e6c"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/silo version")
  end
end
