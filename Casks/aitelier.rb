cask "aitelier" do
  arch arm: "arm64", intel: "intel"

  version "0.2.1"
  sha256 arm:   "cefb73a01cda7984d567d08c8df20b3833a5b732cfc9fc656853e2749c885e3c",
         intel: "5fe11232c4124e7e24733de4a1f8703ac0df3a066235da77bb3bf2cd3b7209b2"

  url "https://github.com/davidnussio/aitelier/releases/download/v#{version}/AItelier-#{version}-macOS-#{arch}.dmg"
  name "AItelier"
  desc "Family image studio with consistent styles (GPT Image)"
  homepage "https://github.com/davidnussio/aitelier"

  livecheck do
    url :url
    strategy :github_latest
  end

  # the app updates itself (Electrobun updater)
  auto_updates true

  # signed with Developer ID and notarized: Gatekeeper opens it without extra steps
  app "AItelier.app"

  # the identifier stays the one from Bottega (<= 0.1.0)
  zap trash: [
    "~/Library/Application Support/ch.dambox.bottega",
    "~/Library/Caches/ch.dambox.bottega",
    "~/Library/HTTPStorages/ch.dambox.bottega",
    "~/Library/Preferences/ch.dambox.bottega.plist",
    "~/Library/Saved Application State/ch.dambox.bottega.savedState",
    "~/Library/WebKit/ch.dambox.bottega",
  ]
end
