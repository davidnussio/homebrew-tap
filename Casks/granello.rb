cask "granello" do
  arch arm: "arm64", intel: "intel"

  version "0.1.0"
  sha256 arm:   "259e9668c8d29fdb5b67a398fed1dae4fd869234ae05e3a4b883cb881e6078bd",
         intel: "df99ebd0cc933a5dd7db59e9a8772be230334f18a831c3fdd2a34d858582e586"

  url "https://github.com/davidnussio/granello/releases/download/v#{version}/Granello-#{version}-macOS-#{arch}.dmg"
  name "Granello"
  desc "Meeting notepad with local transcription and AI notes"
  homepage "https://granello.dambox.ch/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # l'app si aggiorna da sola (updater di Tauri)
  auto_updates true
  depends_on macos: :ventura

  app "Granello.app"

  # The app is not signed with an Apple Developer ID yet:
  # drop the quarantine attribute so Gatekeeper lets it open.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Granello.app"],
        must_succeed:   false,
        writable_paths: ["Granello.app"],
        writable_base:  :appdir
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
