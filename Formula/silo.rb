class Silo < Formula
  desc "Seafile-compatible server and client in one binary"
  homepage "https://github.com/dkam/silo"
  version "0.4.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/dkam/silo/releases/download/v0.4.0/silo-v0.4.0-darwin-arm64.tar.gz"
      sha256 "9e80c460951e3c94470197372dd8471ffd354580adce54b53d4c2ceadbea8389"
    end
    on_intel do
      url "https://github.com/dkam/silo/releases/download/v0.4.0/silo-v0.4.0-darwin-amd64.tar.gz"
      sha256 "62fb33b852887144828f7d13a3f275520423f2b3104eb1e1f41b5e39bffd6eaf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dkam/silo/releases/download/v0.4.0/silo-v0.4.0-linux-arm64.tar.gz"
      sha256 "ea0127cebd6025aba44dd8f49bf00f4618bc7eba304904ab5e80b0a7d17cb02d"
    end
    on_intel do
      url "https://github.com/dkam/silo/releases/download/v0.4.0/silo-v0.4.0-linux-amd64.tar.gz"
      sha256 "6039a114dafdf097bf7d144ea81222d3eeb49f9ca5c079617f895d8939453050"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/silo version")
  end
end
