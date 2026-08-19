cask "wakeupneo" do
  version "1.0.8"
  sha256 "d1740e1cc109c25367325f3562987417ca3c032c72497369c80a8f21592c6a2c"

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
