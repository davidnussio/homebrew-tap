class IngombroCli < Formula
  desc "Terminal UI for the Ingombro disk space analyzer and cleaner"
  homepage "https://github.com/davidnussio/ingombro"
  version "1.4.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/davidnussio/ingombro/releases/download/v1.4.0/ingombro-cli-darwin-arm64.tar.gz"
    sha256 "f62b93de056a8ee0f03df7d69eb95a58466e7230a435b84d8581adfc9736c189"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/davidnussio/ingombro/releases/download/v1.4.0/ingombro-cli-linux-x64.tar.gz"
    sha256 "430f88e39010b45cdc5627372133d405ec396e39c433f4cf7d489634fcb98c37"
  end

  def install
    bin.install "ingombro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ingombro --version")
  end
end
