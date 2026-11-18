class Aegis < Formula
  desc "Terminal UI for Aegis AI agents (no Java or Python install required)"
  homepage "https://github.com/bradodarb/aegis-dist"
  version "0.1.11"
  license "Proprietary"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/bradodarb/aegis-dist/releases/download/v0.1.11/aegis-0.1.11-macos-arm64.tar.gz"
      sha256 "d494a913d80720998efaa6a8089fbf533dd07a4bc37cd09258afd8dc6971f799"
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
