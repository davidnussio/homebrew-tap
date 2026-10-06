class EnvsecBeta < Formula
  desc "Secure environment secrets management using native OS credential stores (beta channel)"
  homepage "https://github.com/davidnussio/envsec"
  version "1.1.0-beta.1"
  license "MIT"

  conflicts_with "envsec", because: "both install an envsec binary"

  on_macos do
    on_arm do
      url "https://github.com/davidnussio/envsec/releases/download/v1.1.0-beta.1/envsec-darwin-arm64.tar.gz"
      sha256 "1e2e6558416e125a3cbec805a9671e3ba838334836198389a472802b7d39eb5b"
    end
    on_intel do
      url "https://github.com/davidnussio/envsec/releases/download/v1.1.0-beta.1/envsec-darwin-x64.tar.gz"
      sha256 "31903ea44233565a2ae4693d437347ad83050324ff3c373d6e4fe40e9f9c18cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/davidnussio/envsec/releases/download/v1.1.0-beta.1/envsec-linux-arm64.tar.gz"
      sha256 "ef134f390fbaddddff93356495e8ac6372842402e1f3ccd32e815921b24bb27c"
    end
    on_intel do
      url "https://github.com/davidnussio/envsec/releases/download/v1.1.0-beta.1/envsec-linux-x64.tar.gz"
      sha256 "8f5b0502cecac1ea67eaa51080bbd6046b896ca1811b402e1ca5374a5b3a42e3"
    end
  end

  def install
    bin.install "envsec"
    generate_completions_from_executable(bin/"envsec", "--completions", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/envsec --version")
    shell_output("ENVSEC_DB=#{testpath}/store.sqlite #{bin}/envsec cmd list")
  end
end
