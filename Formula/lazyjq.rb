class Lazyjq < Formula
  desc "A lazygit-style terminal UI to explore JSON with jq"
  homepage "https://github.com/davidnussio/lazyjq"
  version "0.4.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/davidnussio/lazyjq/releases/download/v0.4.1/lazyjq-aarch64-apple-darwin.tar.xz"
      sha256 "38c105b91b4cf36113c882e695f91e1e7b13e00af29a7e0b01ef6b837d518984"
    end
    if Hardware::CPU.intel?
      url "https://github.com/davidnussio/lazyjq/releases/download/v0.4.1/lazyjq-x86_64-apple-darwin.tar.xz"
      sha256 "45a892c9e97883c38c30afdc4c8896877b4a421fb31fe7739c9604768a0d8a0b"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/davidnussio/lazyjq/releases/download/v0.4.1/lazyjq-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "78d9b5907a46993c8fcccfb11ccbcdb56cb6ec7d561ed638952cec59f792e752"
    end
    if Hardware::CPU.intel?
      url "https://github.com/davidnussio/lazyjq/releases/download/v0.4.1/lazyjq-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0ef4704e588a072504326961abf0e328661ce003183d5967bc72509ba6d75786"
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
