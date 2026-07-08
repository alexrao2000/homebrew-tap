class Ezenv < Formula
  desc "Opt-in shell env helpers: per-repo venv auto-activation and python/pip fallback"
  homepage "https://github.com/raocow/ezenv"
  url "https://github.com/raocow/ezenv/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "d02af271bc002cc0e2dd1def80fa7d571e7bd5cd98b0f2ca2b37cbac90dffd7c"
  license "MIT"
  head "https://github.com/raocow/ezenv.git", branch: "master"

  def install
    bin.install "bin/ezenv"
    (share/"ezenv").install Dir["share/ezenv/*.zsh"]
    man1.install "man/ezenv.1"
  end

  def caveats
    <<~EOS
      ezenv features are opt-in. Enable the ones you want, then restart your shell:

        ezenv install autovenv       # per-repo .venv auto-activation
        ezenv install py-fallback    # bare python/pip -> python3/pip3
        ezenv install                # everything
        exec zsh

      `ezenv status` shows what's enabled; `ezenv uninstall <feature>` removes it.
    EOS
  end

  test do
    assert_match "ezenv", shell_output("#{bin}/ezenv --help")
    assert_match "autovenv.zsh", shell_output("#{bin}/ezenv init autovenv")
    assert_path_exists share/"ezenv/autovenv.zsh"
  end
end
