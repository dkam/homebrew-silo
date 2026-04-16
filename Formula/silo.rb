class Silo < Formula
  desc "Seafile-compatible server and client in one binary"
  homepage "https://github.com/dkam/silo"
  version "0.3.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/dkam/silo/releases/download/v0.3.0/silo-v0.3.0-darwin-arm64.tar.gz"
      sha256 "a1f5a331bb38241bbd8c61a82d5a170ba6b8859495ec44931aacbab58d12a135"
    end
    on_intel do
      url "https://github.com/dkam/silo/releases/download/v0.3.0/silo-v0.3.0-darwin-amd64.tar.gz"
      sha256 "18b0132f9f365bc211061733b7c2ad1cd6a255cba86eb6a2fe85b6f5796de9bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dkam/silo/releases/download/v0.3.0/silo-v0.3.0-linux-arm64.tar.gz"
      sha256 "f42168ccd2ab6298cded4256064c26e36558fc8b78aba3f10fa451c3ccbd6347"
    end
    on_intel do
      url "https://github.com/dkam/silo/releases/download/v0.3.0/silo-v0.3.0-linux-amd64.tar.gz"
      sha256 "2e528724d20f86b21dc03b330533ec43e87f79d284e4c69ee70c0fa740dd2dee"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/silo version")
  end
end
