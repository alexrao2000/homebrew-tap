class Ezenv < Formula
  desc "Opt-in shell env helpers: per-repo venv auto-activation and python/pip fallback"
  homepage "https://github.com/raocow/ezenv"
  url "https://github.com/raocow/ezenv/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "20721ed39b9b3ea793ab02ae6689621e5679c3e8e19455d7bf27a9a157f9782b"
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

        ezenv enable autovenv        # per-repo .venv auto-activation
        ezenv enable pyf             # bare python/pip -> python3/pip3
        ezenv enable                 # everything
        exec zsh

      `ezenv status` shows what's enabled; `ezenv disable <feature>` turns one off.
    EOS
  end

  test do
    assert_match "ezenv", shell_output("#{bin}/ezenv --help")
    assert_match "autovenv.zsh", shell_output("#{bin}/ezenv init autovenv")
    assert_path_exists share/"ezenv/autovenv.zsh"
  end
end
