class AegisHub < Formula
  desc "Connect Aegis agents to Slack"
  homepage "https://github.com/bradodarb/aegis-dist"
  version "0.1.0"
  license "Proprietary"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/bradodarb/aegis-dist/releases/download/hub-v0.1.0/aegis-hub-0.1.0-macos-arm64.tar.gz"
      sha256 "1629bb8272ba8dc0b977d05e41fcf2a74679da75e33a7d0c87aa0ce7fe3bad2e"
    end
    on_intel do
      odie "aegis-hub: this release supports macOS on Apple silicon only"
    end
  end

  def install
    libexec.install "aegis-hub", "aegis-hub-service.sh"
    bin.install_symlink libexec/"aegis-hub-service.sh" => "aegis-hub"
    (var/"log").mkpath
  end

  service do
    run [opt_libexec/"aegis-hub-service.sh"]
    keep_alive true
    log_path var/"log/aegis-hub.log"
    error_log_path var/"log/aegis-hub-error.log"
  end

  test do
    ENV["HOME"] = testpath.to_s
    assert_match "configuration must be a readable regular file", shell_output("#{bin}/aegis-hub 2>&1", 1)
  end
end
