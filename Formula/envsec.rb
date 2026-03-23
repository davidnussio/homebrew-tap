class Envsec < Formula
  desc "Secure environment secrets management using native OS credential stores"
  homepage "https://github.com/davidnussio/envsec"
  url "https://registry.npmjs.org/envsec/-/envsec-1.0.0-beta.0.tgz"
  # To update the sha256, run:
  #   curl -sL https://registry.npmjs.org/envsec/-/envsec-1.0.0-beta.0.tgz | shasum -a 256
  sha256 "dd2c7ae3fc7dd9c3c700610d759e3dbd0048a1b8f725e288c906557790e3839e"
  license "MIT"
  version "1.0.0-beta.0"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/envsec --version")
  end
end
