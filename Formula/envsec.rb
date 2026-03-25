class Envsec < Formula
  desc "Secure environment secrets management using native OS credential stores"
  homepage "https://github.com/davidnussio/envsec"
  url "https://registry.npmjs.org/envsec/-/envsec-1.0.0-beta.2.tgz"
  # To update the sha256, run:
  #   
  sha256 "31ffb457787f16ba0fbc8e4107844f5aa0692b926808866cfd2035851a818e85"
  license "MIT"
  version "1.0.0-beta.2"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/envsec --version")
  end
end
