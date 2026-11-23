cask "granello" do
  version "0.2.7"
  sha256 "c6dc6d253fbf7632d84b368607abaf106f5e13b44009a511587ce5b3b38fd837"

  url "https://github.com/davidnussio/granello/releases/download/v#{version}/Granello-#{version}-macOS-arm64.dmg"
  name "Granello"
  desc "Meeting notepad with local transcription and AI notes"
  homepage "https://granello.dambox.ch/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # l'app si aggiorna da sola (updater di Tauri)
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  # firmata con Developer ID e notarizzata: Gatekeeper la apre senza passaggi
  app "Granello.app"

  zap trash: [
    "~/Library/Application Support/ch.dambox.granello",
    "~/Library/Caches/ch.dambox.granello",
    "~/Library/Logs/ch.dambox.granello",
    "~/Library/Preferences/ch.dambox.granello.plist",
    "~/Library/Saved Application State/ch.dambox.granello.savedState",
    "~/Library/WebKit/ch.dambox.granello",
  ]
end
