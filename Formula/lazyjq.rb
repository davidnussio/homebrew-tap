class Lazyjq < Formula
  desc "A lazygit-style terminal UI to explore JSON with jq"
  homepage "https://github.com/davidnussio/lazyjq"
  version "0.4.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/davidnussio/lazyjq/releases/download/v0.4.0/lazyjq-aarch64-apple-darwin.tar.xz"
      sha256 "422fa0dbd9cd1ec2124fee9f7d9b00bcdac491c1ca8b7cd78b296145085ecfbc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/davidnussio/lazyjq/releases/download/v0.4.0/lazyjq-x86_64-apple-darwin.tar.xz"
      sha256 "e29ad8a70a85ea7c27453e42ae996e534d6748c5fbdc4fb451bb6e1bdd17acd2"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/davidnussio/lazyjq/releases/download/v0.4.0/lazyjq-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "eacca78ee048462723359e86befe1a8aa3677bbcda82d1745a8284cdcba5d92e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/davidnussio/lazyjq/releases/download/v0.4.0/lazyjq-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "cdf077314c88e46ebb745e149bd9416c8ccd8d57cb1ecd87280db86ef67fd5d4"
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
