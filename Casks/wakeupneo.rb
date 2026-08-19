cask "wakeupneo" do
  version "1.0.10"
  sha256 "e91097ea1df24e0bc9e30533d3926ccccf0dfdd90a0f15848558ff8cdf7f7856"

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
