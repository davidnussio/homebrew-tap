class Envsec < Formula
  desc "Secure environment secrets management using native OS credential stores"
  homepage "https://github.com/davidnussio/envsec"
  url "https://registry.npmjs.org/envsec/-/envsec-1.0.0-beta.0.tgz"
  # To update the sha256, run:
  #   curl -sL https://registry.npmjs.org/envsec/-/envsec-1.0.0-beta.0.tgz | shasum -a 256
  sha256 "PLACEHOLDER_RUN_COMMAND_ABOVE_TO_GET_SHA256"
  license "MIT"
  version "1.0.0-beta.0"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/envsec --version")
  end
end:
