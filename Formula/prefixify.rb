class Prefixify < Formula
  desc "Prefixes swift public & open identifier"
  homepage "https://github.com/streamlayer/prefixify"
  url "https://github.com/streamlayer/prefixify.git",
      :tag      => "0.0.6+streamlayer",
      :version  => "0.0.6",
      :revision => "6047f9460f367ad66d3650e77cdc5a74991c0b4d",
      :shallow  => false
  head "https://github.com/streamlayer/prefixify.git", :shallow => false

  depends_on :xcode => ["11.0", :build]

  bottle do
    root_url "https://dl.bintray.com/streamlayer/bottles-formulas"
    cellar :any_skip_relocation
    sha256 "80dfba4ad684b981ea9ea97c5940648fb8d8d89362f23351c241fbb2cc3eb629" => :catalina
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
