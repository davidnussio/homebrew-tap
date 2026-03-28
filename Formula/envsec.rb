class Envsec < Formula
  desc "Secure environment secrets management using native OS credential stores"
  homepage "https://github.com/davidnussio/envsec"
  url "https://registry.npmjs.org/envsec/-/envsec-1.0.0-beta5.tgz"
  # To update the sha256, run:
  # curl -sL https://registry.npmjs.org/envsec/-/envsec-1.0.0-beta5.tgz | shasum -a 256
  sha256 "45ad18c2d38ab66793ef51a7f41cdf3dd759a821782d8b093ab227dbe44669c1"
  license "MIT"
  version "1.0.0-beta5"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/envsec --version")
  end
end
