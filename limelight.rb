class Limelight < Formula
  desc "Standalone port of the yabai v2.4.3 border implementation"
  homepage "https://github.com/LiamKearn/limelight"
  url "https://github.com/LiamKearn/limelight/archive/refs/tags/v1.1.tar.gz"
  sha256 "496b79892ff891113b2c54738ea7e0fab67f75343a29aad08a805d151660d2c5"
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
