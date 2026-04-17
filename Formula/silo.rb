class Silo < Formula
  desc "Seafile-compatible server and client in one binary"
  homepage "https://github.com/dkam/silo"
  version "0.3.1"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/dkam/silo/releases/download/v0.3.1/silo-v0.3.1-darwin-arm64.tar.gz"
      sha256 "701bb0aeb81725660f3624d986b8db0d7b6959842c725f5fd8836a1f36417201"
    end
    on_intel do
      url "https://github.com/dkam/silo/releases/download/v0.3.1/silo-v0.3.1-darwin-amd64.tar.gz"
      sha256 "75cb9a5ce36d8acbcdb070a83e6171efbc674dc2e18a3182b745a4dd49e0ce62"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dkam/silo/releases/download/v0.3.1/silo-v0.3.1-linux-arm64.tar.gz"
      sha256 "83fd9eb8c6664b4f64e9c3d38d223159a8ce4b3dfdc9e913ff4f3f76051e2bb0"
    end
    on_intel do
      url "https://github.com/dkam/silo/releases/download/v0.3.1/silo-v0.3.1-linux-amd64.tar.gz"
      sha256 "3742d5051e84c5971272db87580c74fdc03d5dc38c764ae3b8d99c57e22fcfcd"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/silo version")
  end
end
