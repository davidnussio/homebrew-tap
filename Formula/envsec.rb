class Envsec < Formula
  desc "Secure environment secrets management using native OS credential stores"
  homepage "https://github.com/davidnussio/envsec"
  url "https://registry.npmjs.org/envsec/-/envsec-1.0.0-beta.3.tgz"
  # To update the sha256, run: 
  # curl -sL https://registry.npmjs.org/envsec/-/envsec-1.0.0-beta.3.tgz | shasum -a 256  
  sha256 "278f7e694b1af575bd9b7aa823c130b9026e233e1cf2a240b582ddbc0d284b87"
  license "MIT"
  version "1.0.0-beta.3"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/envsec --version")
  end
end
