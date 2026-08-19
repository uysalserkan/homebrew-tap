cask "wakeupneo" do
  version "1.0.11"
  sha256 "cf919c27b667466ad49384f2437da01ebe5724c4876c86c7d868ee05d4fec26f"

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
