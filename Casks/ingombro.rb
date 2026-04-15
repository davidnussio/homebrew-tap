cask "ingombro" do
  version "1.1.0"
  sha256 "36f75d86bd400309129b15bf63ffb490167ef7c7775fe1fb7c741aa31c4fd5a4"

  url "https://github.com/davidnussio/ingombro/releases/download/v1.1.0/stable-macos-arm64-Ingombro.dmg"
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
