require "open-uri"
require "json"
require "digest"

class GrappleCli < Formula
  desc "Command-line interface for Grapple"
  homepage "https://github.com/grapple-solution/grapple-go-cli"

  url "https://github.com/grapple-solution/grapple-go-cli/archive/refs/tags/0.1.1.tar.gz"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "grpl", "main.go"
    bin.install "grpl"
  end

  test do
    system "#{bin}/grpl", "help"
  end
end