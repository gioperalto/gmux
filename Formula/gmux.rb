class Gmux < Formula
  desc "Composable Claude Code agent team harness"
  homepage "https://github.com/gperalto/gmux"
  url "https://github.com/gperalto/gmux/archive/refs/tags/v0.1.0.tar.gz"
  license "MIT"

  def install
    bin.install "bin/gmux"
    (share/"gmux").install Dir["share/gmux/*"]
  end
end
