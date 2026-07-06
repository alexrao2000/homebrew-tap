class Gtools < Formula
  desc "Personal custom git subcommands: sweep, sync, pr, done"
  homepage "https://github.com/alexrao2000/git-tools"
  url "https://github.com/alexrao2000/git-tools/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "465798a1adc90a160ab508e854a07183b4e8683159ac97900d939588f952b9bf"
  version "0.2.0"

  # `git pr` shells out to the GitHub CLI; the other commands don't need it.
  depends_on "gh"

  def install
    bin.install Dir["bin/git-*"]
  end

  test do
    assert_match "git sweep", shell_output("#{bin}/git-sweep -h")
    assert_match "git done", shell_output("#{bin}/git-done -h")
  end
end
