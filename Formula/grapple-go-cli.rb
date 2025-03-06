class GrappleGoCli < Formula
  desc "Command-line interface for Grapple"
  homepage "https://github.com/grapple-solution/grapple-go-cli"

  url "https://github.com/grapple-solution/grapple-go-cli/archive/refs/tags/0.0.1.tar.gz"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "grapple", "main.go"
    bin.install "grapple"

    # Install additional required directories
    (share/"grapple-go-cli").install "template-files"
    (share/"grapple-go-cli").install "files"
  end

  def caveats
    <<~EOS
      Run 'grapple help' to check the list of avaiable commands
    EOS
  end

  test do
    system "#{bin}/grapple", "help"
  end
end
