class Consuela < Formula
  desc "Reclaim disk space from Xcode leftovers, developer caches, and Docker"
  homepage "https://github.com/exddc/consuela"
  url "https://github.com/exddc/consuela/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "34a086c7cd8f07331661ebab3232c303f31ccbbcbe92a9ceb331c8d01a7fcfe3"
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
