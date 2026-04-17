class Silo < Formula
  desc "Seafile-compatible server and client in one binary"
  homepage "https://github.com/dkam/silo"
  version "0.3.2"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/dkam/silo/releases/download/v0.3.2/silo-v0.3.2-darwin-arm64.tar.gz"
      sha256 "834d3a7e925e8ff245f23f9149661baa0562d215b1239d6e07cd3891b0a9cc53"
    end
    on_intel do
      url "https://github.com/dkam/silo/releases/download/v0.3.2/silo-v0.3.2-darwin-amd64.tar.gz"
      sha256 "59aa2b30e3761cfd46f4b71e22c06f1f26080ebb2d5e06bc227a82d252840536"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dkam/silo/releases/download/v0.3.2/silo-v0.3.2-linux-arm64.tar.gz"
      sha256 "e2b0892c1a4b404e09fbc046b7e3c10d9dae3f66e60fd0fb3778db07f566e8a3"
    end
    on_intel do
      url "https://github.com/dkam/silo/releases/download/v0.3.2/silo-v0.3.2-linux-amd64.tar.gz"
      sha256 "c92c4e83ad7ed960c0cb19a81c35f64b600e262d712ff344ef03ca8c68bf16fd"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/silo version")
  end
end
