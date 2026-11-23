cask "ingombro" do
  version "2.0.1"
  sha256 "960c2821663f8efa7f64b99c7b9a0318f97e2b5b0fce58835a5ea73b0fa84cd2"

  url "https://github.com/davidnussio/ingombro/releases/download/v2.0.1/stable-macos-arm64-Ingombro.dmg"
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
