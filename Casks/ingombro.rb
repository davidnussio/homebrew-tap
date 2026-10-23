cask "ingombro" do
  version "1.4.0"
  sha256 "981e4392a4237b552fac074eb9e49bb3eab305f0f61fb163d4cdab20ccb204c8"

  url "https://github.com/davidnussio/ingombro/releases/download/v1.4.0/stable-macos-arm64-Ingombro.dmg"
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
