class Aegis < Formula
  desc "Terminal UI for Aegis AI agents (no Java or Python install required)"
  homepage "https://github.com/bradodarb/aegis-dist"
  version "0.1.5"
  license "Proprietary"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/bradodarb/aegis-dist/releases/download/v0.1.5/aegis-0.1.5-macos-arm64.tar.gz"
      sha256 "59cbdf001bc64696a4ebbccf2fd28121f2ae9672717034e55bd4ccd13054f8d1"
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
