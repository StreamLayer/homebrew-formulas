class Prefixify < Formula
  desc "Prefixes swift public & open identifier"
  homepage "https://github.com/streamlayer/prefixify"
  url "https://github.com/streamlayer/prefixify.git",
      :tag      => "0.0.10+streamlayer",
      :version  => "0.0.10",
      :revision => "4296cbf439a3ac227c445afe08637e95664edb46",
      :shallow  => false
  head "https://github.com/streamlayer/prefixify.git", :shallow => false

  depends_on :xcode => ["11.0", :build]

  bottle do
    root_url "https://dl.bintray.com/streamlayer/bottles-formulas"
    cellar :any_skip_relocation
    sha256 "3c97de30fdd213246b47c38ec1944ef3bc0212e153275f3b4a199dff8599b16e" => :catalina
  end

  def install
    if MacOS::Xcode.version >= "11.0" && MacOS.full_version < "10.15.0" && MacOS.version >= "10.15"
      odie "Xcode >=11.0 requires macOS >=10.15.0 to build Swift formulae."
    end

    system "make", "prefix_install", "PREFIX=#{prefix}"
  end

  test do
    system bin/"swift-prefixify", "version"
  end
end
