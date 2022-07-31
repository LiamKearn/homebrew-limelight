class Limelight < Formula
  desc "Standalone port of the yabai v2.4.3 border implementation"
  homepage "https://github.com/LiamKearn/limelight"
  url "https://github.com/LiamKearn/limelight/archive/refs/tags/v1.0.tar.gz"
  sha256 "57f8be0daf34d230f8c87b332e49b93308d63cd0d30795ba48198ecb5640eb31"
  license "MIT"

  # This is what yabai depends on, It might be a bit out of date since limelight is now
  # discontinued but I can't be bothered finding out right now.
  depends_on :macos => :high_sierra

  def install
    system "make"

    bin.install "#{buildpath}/bin/limelight"
    man1.install "#{buildpath}/doc/limelight.1"
  end

  test do
    assert_match "limelight-v#{version}", shell_output("#{bin}/limelight --version")
  end
end
