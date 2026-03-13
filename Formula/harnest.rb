class Harnest < Formula
  desc "Composable Claude Code agent team harness"
  homepage "https://github.com/gioperalto/harnest"
  url "https://github.com/gioperalto/harnest/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "9f210c61fc07c3ad2e2dc32212302d3b62180bf50f4ee7dcfe157760cc07d52f"
  license "MIT"

  def install
    bin.install "bin/harnest"
    (share/"harnest/nest").install Dir["nest/*"]
    (share/"harnest/lib").install Dir["lib/*"]
  end
end
