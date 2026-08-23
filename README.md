# Dotfiles

Configuration files tracked as a [bare git repository](https://www.atlassian.com/git/tutorials/dotfiles).

## Installation

The checkout overwrites existing files in `$HOME`, so back up anything that
matters first.

```shell
git clone --bare git@github.com:yeetypete/dotfiles.git $HOME/.dotfiles
alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
dot checkout --force
dot config --local status.showUntrackedFiles no
```

The `dot` alias is defined permanently in
[.config/fish/config.fish](.config/fish/config.fish), so it is available in new
shells once the checkout is done.

## Usage

Use `dot` anywhere in `$HOME` exactly like `git`:

```shell
dot status
dot add .config/foo/bar
dot commit -m "fix: update foo bar"
dot push
```
