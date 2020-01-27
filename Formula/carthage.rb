class Carthage < Formula
  desc "Decentralized dependency manager for Cocoa"
  homepage "https://github.com/streamlayer/Carthage"
  url "https://github.com/streamlayer/Carthage.git",
      :tag      => "0.44.3+streamlayer",
      :version  => "0.44.3",
      :revision => "88c0fd3086aafe7d65da2e19f9fa7a0b996c4950",
      :shallow  => false
  head "https://github.com/streamlayer/Carthage.git", :shallow => false

  depends_on :xcode => ["11.0", :build]

  bottle do
    root_url "https://dl.bintray.com/streamlayer/bottles-formulas"
    cellar :any_skip_relocation
    sha256 "a74815e55477f46f4e7b2aa8cc939bdbe9299c686d2d52213d14d24abebdfd38" => :catalina
  end

  def install
    if MacOS::Xcode.version >= "11.0" && MacOS.full_version < "10.15.0" && MacOS.version >= "10.15"
      odie "Xcode >=11.0 requires macOS >=10.15.0 to build Swift formulae."
    end

    system "make", "prefix_install", "PREFIX=#{prefix}"
    bash_completion.install "Source/Scripts/carthage-bash-completion" => "carthage"
    zsh_completion.install "Source/Scripts/carthage-zsh-completion" => "_carthage"
    fish_completion.install "Source/Scripts/carthage-fish-completion" => "carthage.fish"
  end

  test do
    system bin/"carthage", "version"
  end
end
