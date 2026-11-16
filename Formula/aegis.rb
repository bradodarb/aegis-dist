class Aegis < Formula
  desc "Terminal UI for Aegis AI agents (no Java or Python install required)"
  homepage "https://github.com/bradodarb/aegis-dist"
  version "0.1.7"
  license "Proprietary"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/bradodarb/aegis-dist/releases/download/v0.1.7/aegis-0.1.7-macos-arm64.tar.gz"
      sha256 "241cdfe14284952aaec02579be3008d3fc4b74116e6b48afc2279d8a82824c80"
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
