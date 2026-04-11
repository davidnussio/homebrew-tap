cask "ingombro" do
  version "1.0.0"
  sha256 "0852c51d07fdfac3d654910257185d41cc7d7c12dceef1b04b532bda8e12aab3"

  url "https://github.com/davidnussio/ingombro/releases/download/v1.0.0/stable-macos-arm64-Ingombro.dmg"
  name "Ingombro"
  desc "Disk space analyzer and cleaner"
  homepage "https://github.com/davidnussio/ingombro"

  depends_on arch: :arm64

  app "Ingombro.app"

  zap trash: [
    "~/Library/Application Support/ingombro.electrobun.dev",
    "~/Library/Preferences/ingombro.electrobun.dev.plist",
  ]
end
