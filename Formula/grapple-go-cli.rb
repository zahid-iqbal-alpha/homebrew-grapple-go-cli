class GrappleGoCli < Formula
  desc "Command-line interface for Grapple"
  homepage "https://github.com/grapple-solution/grapple-go-cli"

  url "https://github.com/grapple-solution/grapple-go-cli/archive/refs/tags/0.0.1.tar.gz"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "grpl", "main.go"
    bin.install "grpl"

    # Install additional required directories
    (share/"grapple-go-cli").install "template-files"
    (share/"grapple-go-cli").install "files"
  end

  def caveats
    <<~EOS
      The required template files and additional files are installed at:
        $(brew --prefix)/share/grapple-go-cli/template-files
        $(brew --prefix)/share/grapple-go-cli/files

      The CLI automatically finds these files when executed.
    EOS
  end

  test do
    system "#{bin}/grpl", "help"
  end
end
