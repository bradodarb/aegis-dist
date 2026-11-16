class Aegis < Formula
  desc "Terminal UI for Aegis AI agents (no Java or Python install required)"
  homepage "https://github.com/bradodarb/aegis-dist"
  version "0.1.6"
  license "Proprietary"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/bradodarb/aegis-dist/releases/download/v0.1.6/aegis-0.1.6-macos-arm64.tar.gz"
      sha256 "789178036a5b64a0616b4c4153baf47f87cdae5d689a6834eec36a3f6a01547a"
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
