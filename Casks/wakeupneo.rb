cask "wakeupneo" do
  version "1.0.6"
  sha256 "01cf44673322960c9de24ddcaabf493e6ab688548da4da12a6956ae0b0e2de47"

  url "https://github.com/uysalserkan/WakeUpNeo/releases/download/v#{version}/WakeUpNeo-#{version}-macOS.zip"
  name "WakeUpNeo"
  desc "Native macOS menu bar utility to prevent sleep during critical tasks"
  homepage "https://github.com/uysalserkan/WakeUpNeo"

  depends_on macos: :sequoia

  app "WakeUpNeo.app"

  postflight do
    system_command "xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/WakeUpNeo.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.wakeupneo.app",
    "~/Library/Caches/com.wakeupneo.app",
    "~/Library/Preferences/com.wakeupneo.app.plist",
  ]
end
