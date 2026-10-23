class IngombroCli < Formula
  desc "Terminal UI for the Ingombro disk space analyzer and cleaner"
  homepage "https://github.com/davidnussio/ingombro"
  version "2.0.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/davidnussio/ingombro/releases/download/v2.0.0/ingombro-cli-darwin-arm64.tar.gz"
    sha256 "07ddc9d029a3dabf9086ee814a53cb6b9db2392f918db9645bae394c2fc83274"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/davidnussio/ingombro/releases/download/v2.0.0/ingombro-cli-linux-x64.tar.gz"
    sha256 "54368364b4d9b901815e81e2022aefe5b915504e6f8847c3e385a53d1748d9ff"
  end

  def install
    bin.install "ingombro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ingombro --version")
  end
end
