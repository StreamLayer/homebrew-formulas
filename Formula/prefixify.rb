class Prefixify < Formula
  desc "Prefixes swift public & open identifier"
  homepage "https://github.com/streamlayer/prefixify"
  url "https://github.com/streamlayer/prefixify.git",
      :tag      => "0.0.4+streamlayer",
      :version  => "0.0.4",
      :revision => "f3f426d5413046a45c05223a6305cd0326f202f9",
      :shallow  => false
  head "https://github.com/streamlayer/prefixify.git", :shallow => false

  depends_on :xcode => ["11.0", :build]

  bottle do
    root_url "https://dl.bintray.com/streamlayer/bottles-formulas"
    cellar :any_skip_relocation
    sha256 "f3f5fff533cc6ba39f68a3f447423f65ff62d39e67292baca53b8f3a9863d28a" => :catalina
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
