class Envsec < Formula
  desc "Secure environment secrets management using native OS credential stores"
  homepage "https://github.com/davidnussio/envsec"
  version "1.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/davidnussio/envsec/releases/download/v1.1.2/envsec-darwin-arm64.tar.gz"
      sha256 "d28ab33c250e401c1da4d2825cc9e4057ef8947996a0baefa07b685a7a389f9f"
    end
    on_intel do
      url "https://github.com/davidnussio/envsec/releases/download/v1.1.2/envsec-darwin-x64.tar.gz"
      sha256 "754fb9c4bea672f9dbe134e114722a17cf3893838717dfd393921e26c792b9aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/davidnussio/envsec/releases/download/v1.1.2/envsec-linux-arm64.tar.gz"
      sha256 "be11fa30d4b65fae855258cc62bc4962a31c8a19fe3e00792b6befd1bfe98a63"
    end
    on_intel do
      url "https://github.com/davidnussio/envsec/releases/download/v1.1.2/envsec-linux-x64.tar.gz"
      sha256 "06fee9a9bb63ee46089e052c9c1858ee562c76dcde192b53a1a3621cb123c1f5"
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
