cask "ingombro" do
  version "2.0.0"
  sha256 "623d1c8ea068be7d45183bc732e3273dfa0283979db77d6fb6ad78f4477c6b53"

  url "https://github.com/davidnussio/ingombro/releases/download/v2.0.0/stable-macos-arm64-Ingombro.dmg"
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
