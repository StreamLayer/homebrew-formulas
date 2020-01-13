class Prefixify < Formula
  desc "Prefixes swift public & open identifier"
  homepage "https://github.com/streamlayer/prefixify"
  url "https://github.com/streamlayer/prefixify.git",
      :tag      => "0.0.18+streamlayer",
      :version  => "0.0.18",
      :revision => "f2bf75abcb84bfb0ea5ce2e74e576ee0a87dca4d",
      :shallow  => false
  head "https://github.com/streamlayer/prefixify.git", :shallow => false

  depends_on :xcode => ["11.0", :build]

  bottle do
    root_url "https://dl.bintray.com/streamlayer/bottles-formulas"
    cellar :any_skip_relocation
    sha256 "22ca6e502c713ccb8042e750997ba49c548a51107c67f4ae65ddef471c5a0823" => :catalina
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
