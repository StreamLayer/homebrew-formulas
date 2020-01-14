class Carthage < Formula
  desc "Decentralized dependency manager for Cocoa"
  homepage "https://github.com/streamlayer/Carthage"
  url "https://github.com/streamlayer/Carthage.git",
      :tag      => "0.43.2+streamlayer",
      :version  => "0.43.2",
      :revision => "1026a648ae3056d907063d351edd75bcaacdf795",
      :shallow  => false
  head "https://github.com/streamlayer/Carthage.git", :shallow => false

  depends_on :xcode => ["11.0", :build]

  bottle do
    root_url "https://dl.bintray.com/streamlayer/bottles-formulas"
    cellar :any_skip_relocation
    sha256 "0ef3a0963e2fb86820a91b5366cac58c2895f06ed8556a5ea2abd3db4ded3c95" => :catalina
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
