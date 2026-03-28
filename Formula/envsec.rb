class Envsec < Formula
  desc "Secure environment secrets management using native OS credential stores"
  homepage "https://github.com/davidnussio/envsec"
  url "https://registry.npmjs.org/envsec/-/envsec-1.0.0-beta6.tgz"
  # To update the sha256, run:
  # curl -sL https://registry.npmjs.org/envsec/-/envsec-1.0.0-beta6.tgz | shasum -a 256
  sha256 "cb34874bef254062eb7f04f25db9143fd90125590282d7dfb41e00ecd4de2db2"
  license "MIT"
  version "1.0.0-beta6"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
    generate_completions_from_executable(bin/"envsec", "--completions", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/envsec --version")
  end
end
