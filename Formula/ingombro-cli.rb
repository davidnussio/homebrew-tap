class IngombroCli < Formula
  desc "Terminal UI for the Ingombro disk space analyzer and cleaner"
  homepage "https://github.com/davidnussio/ingombro"
  version "2.0.1"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/davidnussio/ingombro/releases/download/v2.0.1/ingombro-cli-darwin-arm64.tar.gz"
    sha256 "e5191a95bc10eff40d00d2959c03cdc0436aa86e867903d09ef6ff5bc6d5345d"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/davidnussio/ingombro/releases/download/v2.0.1/ingombro-cli-linux-x64.tar.gz"
    sha256 "fc8ecb7f05f299d418274c5ae208eb1b6e15e8fa31244612435fe9579c62b862"
  end

  def install
    bin.install "ingombro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ingombro --version")
  end
end
