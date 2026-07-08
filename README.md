# homebrew-tap

Personal Homebrew tap.

```bash
brew tap raocow/tap             # once
brew trust raocow/tap           # once — Homebrew gates third-party taps
```

## Formulae

### gtools — [raocow/gtools](https://github.com/raocow/gtools)

```bash
brew install gtools             # then: brew upgrade gtools
```

Installs the `git sweep`, `git sync`, `git pr`, and `git done` subcommands.

### ezenv — [raocow/ezenv](https://github.com/raocow/ezenv)

```bash
brew install ezenv
ezenv install autovenv          # or: ezenv install (all); then exec zsh
```

Opt-in zsh helpers: per-repo `.venv` auto-activation and bare `python`/`pip`
→ `python3`/`pip3` fallback. `ezenv install <feature>` enables one by editing
`~/.zshrc` for you; `ezenv uninstall`/`status` manage them.
