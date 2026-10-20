class Consuela < Formula
  desc "Reclaim disk space from Xcode leftovers, developer caches, and Docker"
  homepage "https://github.com/exddc/consuela"
  url "https://github.com/exddc/consuela/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d4311866d942ba389b4d5bf2db24360e067717dd2613a1ad6931af210cce6f1e"
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
