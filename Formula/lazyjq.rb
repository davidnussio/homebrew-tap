class Lazyjq < Formula
  desc "A lazygit-style terminal UI to explore JSON with jq"
  homepage "https://github.com/davidnussio/lazyjq"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/davidnussio/lazyjq/releases/download/v0.2.0/lazyjq-aarch64-apple-darwin.tar.xz"
      sha256 "8eb8c36d4d8c21e73ca47cc276798db1735b8cce02c70b53fc91cbce04f89d9e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/davidnussio/lazyjq/releases/download/v0.2.0/lazyjq-x86_64-apple-darwin.tar.xz"
      sha256 "275e85b98ecb980ac4f58a372f719477a7f760536d4053b499092d77ea100631"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/davidnussio/lazyjq/releases/download/v0.2.0/lazyjq-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "2dc116970ad4a5914159d945d097bab3ffc9ee894e16b3a829c093f03155366a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/davidnussio/lazyjq/releases/download/v0.2.0/lazyjq-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "279cfecf0abc1b74dd235d61ce19233ec061ba546407d685880d6c150e126438"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":              {},
    "aarch64-unknown-linux-gnu":         {},
    "armv7-unknown-linux-gnueabihf":     {},
    "x86_64-apple-darwin":               {},
    "x86_64-pc-windows-gnu":             {},
    "x86_64-unknown-linux-gnu":          {},
    "x86_64-unknown-linux-musl-dynamic": {},
    "x86_64-unknown-linux-musl-static":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "lazyjq"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "lazyjq"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "lazyjq"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "lazyjq"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
