class Prefixify < Formula
  desc "Prefixes swift public & open identifier"
  homepage "https://github.com/streamlayer/prefixify"
  url "https://github.com/streamlayer/prefixify.git",
      :tag      => "0.0.7+streamlayer",
      :version  => "0.0.7",
      :revision => "52eb80fb907d3382d6d1b70a14939ad262041d1a",
      :shallow  => false
  head "https://github.com/streamlayer/prefixify.git", :shallow => false

  depends_on :xcode => ["11.0", :build]

  bottle do
    root_url "https://dl.bintray.com/streamlayer/bottles-formulas"
    cellar :any_skip_relocation
    sha256 "da7d43c62b72e28b9a09b0b29f68bca665e52db8e42906e7797bcc0c2508bbe9" => :catalina
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
