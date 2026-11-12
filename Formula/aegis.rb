class Aegis < Formula
  desc "Terminal UI for Aegis AI agents (no Java or Python install required)"
  homepage "https://github.com/bradodarb/aegis-dist"
  version "0.1.4"
  license "Proprietary"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/bradodarb/aegis-dist/releases/download/v0.1.4/aegis-0.1.4-macos-arm64.tar.gz"
      sha256 "2bbc6f87b23ed67887072cf3967b83d4eb383e7751bf4ee3482edffee1bc3adc"
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
