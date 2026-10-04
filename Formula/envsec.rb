class Envsec < Formula
  desc "Secure environment secrets management using native OS credential stores"
  homepage "https://github.com/davidnussio/envsec"
  url "https://registry.npmjs.org/envsec/-/envsec-1.0.2.tgz"
  sha256 "82ef6f1b22305291e1bc07da69dd30e700ac45acd616917ad2059f57c59b9d9d"
  license "MIT"
  version "1.0.2"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args, "--min-release-age=0"
    bin.install_symlink libexec.glob("bin/*")
    generate_completions_from_executable(bin/"envsec", "--completions", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/envsec --version")
  end
end
