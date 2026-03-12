class Gmux < Formula
  desc "Composable Claude Code agent team harness"
  homepage "https://github.com/gperalto/gmux"
  url "https://github.com/gioperalto/gmux/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "f3697b877a5d4cc41907b33cd6898fbda0b5775799b1edd847b6eb5c79c7c7d1"
  license "MIT"

  def install
    bin.install "bin/gmux"
    (share/"gmux/templates").install Dir["templates/*"]
    (share/"gmux/lib").install Dir["lib/*"]
  end
end
