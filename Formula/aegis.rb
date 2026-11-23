class Aegis < Formula
  desc "Terminal UI for Aegis AI agents (no Java or Python install required)"
  homepage "https://github.com/bradodarb/aegis-dist"
  version "0.1.23"
  license "Proprietary"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/bradodarb/aegis-dist/releases/download/v0.1.23/aegis-0.1.23-macos-arm64.tar.gz"
      sha256 "f8b0fe3a3ee896361f3ca2de3580e218e5ad94f7ed0152a2ae60c07e09e1bb01"
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
