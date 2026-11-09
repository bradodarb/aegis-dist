class Aegis < Formula
  desc "Terminal UI for Aegis AI agents (no Java or Python install required)"
  homepage "https://github.com/bradodarb/aegis-dist"
  version "0.1.1"
  license "Proprietary"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/bradodarb/aegis-dist/releases/download/v0.1.1/aegis-0.1.1-macos-arm64.tar.gz"
      sha256 "f68f68a82910a0cdf4deef1e63bd0e8d43c7e724218f88aaa50b5f2cd3a3e4f6"
    end
    on_intel do
      odie "aegis: no macOS x86_64 build yet — see homebrew/README.md"
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
