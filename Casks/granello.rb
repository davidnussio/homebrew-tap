cask "granello" do
  version "0.2.6"
  sha256 "1715935455a84513368482b9fd09f3563af52dcf5711883d670ca3995bc38851"

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

  app "Granello.app"

  # The app is not signed with an Apple Developer ID yet:
  # drop the quarantine attribute so Gatekeeper lets it open.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Granello.app"],
        must_succeed:   false,
        writable_paths: ["Granello.app"],
        writable_base:  "appdir" # string, not symbol: mise bootstrap cannot read symbols here
  end

  zap trash: [
    "~/Library/Application Support/ch.dambox.granello",
    "~/Library/Caches/ch.dambox.granello",
    "~/Library/Logs/ch.dambox.granello",
    "~/Library/Preferences/ch.dambox.granello.plist",
    "~/Library/Saved Application State/ch.dambox.granello.savedState",
    "~/Library/WebKit/ch.dambox.granello",
  ]
end
