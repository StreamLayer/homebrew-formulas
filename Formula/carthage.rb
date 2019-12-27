class Carthage < Formula
  desc "Decentralized dependency manager for Cocoa"
  homepage "https://github.com/streamlayer/Carthage"
  url "https://github.com/streamlayer/Carthage.git",
      :tag      => "0.43.1+streamlayer",
      :version  => "0.43.1",
      :revision => "59ba69cdc48579caaafe67ef94a7fb331cc67eca",
      :shallow  => false
  head "https://github.com/streamlayer/Carthage.git", :shallow => false

  depends_on :xcode => ["11.0", :build]

  bottle do
    root_url "https://dl.bintray.com/streamlayer/bottles-formulas"
    cellar :any_skip_relocation
    sha256 "afbeff5ecadcc57ca45661672a9ec893742724ad88077060b55c485b680e74b6" => :catalina
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
