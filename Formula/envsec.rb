class Envsec < Formula
  desc "Secure environment secrets management using native OS credential stores"
  homepage "https://github.com/davidnussio/envsec"
  url "https://registry.npmjs.org/envsec/-/envsec-1.0.0-beta.12.tgz"
  sha256 "33c2f476d79918144e87121dd3e5d96db3896130d95c182d445d0f84968163e2"
  license "MIT"
  version "1.0.0-beta.12"

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
