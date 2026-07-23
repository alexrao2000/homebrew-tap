class Gtools < Formula
  desc "Personal custom git subcommands: sweep, sync, pr, done"
  homepage "https://github.com/raocow/gtools"
  url "https://github.com/raocow/gtools/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "0ac1291337fa18e9349a96a5c8bcfdf46280dda8914f50ea998ab30febd0ba12"

  # `git pr` shells out to the GitHub CLI; the other commands don't need it.
  depends_on "gh"

  def install
    bin.install Dir["bin/git-*"]
    man1.install Dir["man/git-*.1"]
    lib.install "lib/git-tools-common.sh" if File.exist?("lib/git-tools-common.sh")
    zsh_completion.install Dir["share/zsh/site-functions/*"] if
      Dir.exist?("share/zsh/site-functions")
  end

  def caveats
    <<~EOS
      For Tab-completion of these commands — including 'git new <TAB>' for
      cycling through short branch names instead of typing a long one — make
      sure Homebrew's zsh completions are on your fpath (skip if you already
      have this, e.g. from another formula):

        fpath=(#{HOMEBREW_PREFIX}/share/zsh/site-functions $fpath)
        autoload -Uz compinit && compinit
    EOS
  end

  test do
    assert_match "git sweep", shell_output("#{bin}/git-sweep -h")
    assert_match "git done", shell_output("#{bin}/git-done -h")
    assert_path_exists man1/"git-done.1"
  end
end
