class Silo < Formula
  desc "Seafile-compatible server and client in one binary"
  homepage "https://github.com/dkam/silo"
  version "0.4.3"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/dkam/silo/releases/download/v0.4.3/silo-v0.4.3-darwin-arm64.tar.gz"
      sha256 "81b0c54f7257f8f048418d30a5c3b4b46da29dd75379a4e3023819c47e2560e7"
    end
    on_intel do
      url "https://github.com/dkam/silo/releases/download/v0.4.3/silo-v0.4.3-darwin-amd64.tar.gz"
      sha256 "7217a1ae1698e89f005f25ffc9810f7469a9a4e1a7d2326fd6f722c78989f4e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dkam/silo/releases/download/v0.4.3/silo-v0.4.3-linux-arm64.tar.gz"
      sha256 "601faf095dfa7f42b7b553f3789e9b9da0f32606eeb537e1966c0c6ec169d81a"
    end
    on_intel do
      url "https://github.com/dkam/silo/releases/download/v0.4.3/silo-v0.4.3-linux-amd64.tar.gz"
      sha256 "a183e14d398897909f3eb4b30dc45c89f0cbc8c36e289b2c85ef917af741b5fe"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/silo version")
  end
end
