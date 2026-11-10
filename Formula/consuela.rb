class Consuela < Formula
  desc "Reclaim disk space from Xcode leftovers, developer caches, and Docker"
  homepage "https://github.com/exddc/consuela"
  url "https://github.com/exddc/consuela/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "801d6e5ae5d677437113937ab6fa1d3c2c8e1fb07ad72ab0a93d258cecb8f87b"
  license "MIT"

  depends_on :macos

  def install
    inreplace "consuela", /^INSTALL_METHOD=script$/, "INSTALL_METHOD=brew"
    bin.install "consuela"
  end

  test do
    assert_equal "consuela #{version}", shell_output("#{bin}/consuela --version").strip
    system bin/"consuela", "--dry-run", "--cache"
    assert_match "brew upgrade consuela", shell_output("#{bin}/consuela --update")
  end
end
