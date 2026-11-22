class Aegis < Formula
  desc "Terminal UI for Aegis AI agents (no Java or Python install required)"
  homepage "https://github.com/bradodarb/aegis-dist"
  version "0.1.21"
  license "Proprietary"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/bradodarb/aegis-dist/releases/download/v0.1.21/aegis-0.1.21-macos-arm64.tar.gz"
      sha256 "9a1ed39162dfb30fe006de74b9fe9c0110ff8c23d30a8df278c471165575cf76"
    end
    on_intel do
      odie "aegis: this release supports macOS on Apple silicon only"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"aegis"
  end

  test do
    system "#{bin}/aegis", "--help"
  end
end
