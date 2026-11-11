class Lazyjq < Formula
  desc "A lazygit-style terminal UI to explore JSON with jq"
  homepage "https://github.com/davidnussio/lazyjq"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/davidnussio/lazyjq/releases/download/v0.1.0/lazyjq-aarch64-apple-darwin.tar.xz"
      sha256 "825e8bee3f5336d773a63d3b748bd53cacaf32cf3d7a0f04967b53228b721033"
    end
    if Hardware::CPU.intel?
      url "https://github.com/davidnussio/lazyjq/releases/download/v0.1.0/lazyjq-x86_64-apple-darwin.tar.xz"
      sha256 "251d434cc5437e634345acd2100e495524b894e0cef1d5808496a6018d426b78"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/davidnussio/lazyjq/releases/download/v0.1.0/lazyjq-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8b9d80f6f0ee813c6c35edee322ed68786d5d8ecdd3690e9566a20b8bcf3b2e7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/davidnussio/lazyjq/releases/download/v0.1.0/lazyjq-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ed5900ab887a6f63493d6681618348aa443b3c49bdf99488ce72b6faaae113c9"
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
