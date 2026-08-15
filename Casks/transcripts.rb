cask "transcripts" do
  version "1.0.0-beta.1"
  sha256 "be66c325b35ebee790ae675dfa848b63f603e4faeb3d0de8284dfb5338f6824c"

  url "https://transcripts.hatcher.ltd/Transcripts-#{version}.zip"
  name "Transcripts"
  desc "Voice notes and meeting transcripts, recorded and transcribed on-device"
  homepage "https://transcripts.hatcher.ltd"

  livecheck do
    url "https://transcripts.hatcher.ltd/appcast.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: ">= :sonoma"

  app "Transcripts.app"

  zap trash: [
    "~/Library/Application Support/Transcripts",
    "~/Library/Logs/Transcripts.log",
    "~/Library/Preferences/ltd.hatcher.transcripts.plist",
  ]
end
