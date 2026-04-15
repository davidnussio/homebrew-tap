cask "ingombro" do
  version "1.2.0"
  sha256 "900289ef725d74da9f671044ec90c33ec138dfc9019939b5a17a1afbe5e6cac4"

  url "https://github.com/davidnussio/ingombro/releases/download/v1.2.0/stable-macos-arm64-Ingombro.dmg"
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
