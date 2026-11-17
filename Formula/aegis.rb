class Aegis < Formula
  desc "Terminal UI for Aegis AI agents (no Java or Python install required)"
  homepage "https://github.com/bradodarb/aegis-dist"
  version "0.1.9"
  license "Proprietary"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/bradodarb/aegis-dist/releases/download/v0.1.9/aegis-0.1.9-macos-arm64.tar.gz"
      sha256 "f9ced5f50ab8102a1fbde29606b61e3cbb08b77f332a4f5a510e9705482a338c"
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
