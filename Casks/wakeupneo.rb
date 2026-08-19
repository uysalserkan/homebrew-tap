cask "wakeupneo" do
  version "1.0.16"
  sha256 "07da554aea7e2aa265c353b2cdaf1b849a9d9125d0fb0eed16e6d945cdf9ccab"

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
