class Aegis < Formula
  desc "Terminal UI for Aegis AI agents (no Java or Python install required)"
  homepage "https://github.com/bradodarb/aegis-dist"
  version "0.1.22"
  license "Proprietary"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/bradodarb/aegis-dist/releases/download/v0.1.22/aegis-0.1.22-macos-arm64.tar.gz"
      sha256 "bbf680cfdbab3a2b7833ab4f08c19dcfbf609696962e514ddd99c05537784623"
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
