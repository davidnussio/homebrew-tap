cask "ingombro" do
  version "1.3.0"
  sha256 "5286917378cd468342bde6a32e903af770b4a8b4707a59f443246a7285da0cdf"

  url "https://github.com/davidnussio/ingombro/releases/download/v1.3.0/stable-macos-arm64-Ingombro.dmg"
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
