# Dotfiles

Configuration files managed with [chezmoi](https://www.chezmoi.io).

## Installation

Install chezmoi, clone this repository and apply it to `$HOME` in one step.
On a machine with existing configs this overwrites them without prompting, so
run `chezmoi init yeetypete` and inspect `chezmoi diff` first.

```shell
sudo apt install -y git-lfs
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin" init --apply --git-lfs yeetypete
```

## Usage

The source repository lives in `~/.local/share/chezmoi`. Running `chezmoi
apply` writes it out to `$HOME`.

```shell
chezmoi add ~/.config/foo/bar     # start tracking a file
chezmoi edit ~/.config/foo/bar    # edit the source copy
chezmoi diff                      # preview pending changes
chezmoi apply                     # write changes to $HOME
chezmoi cd                        # open a shell in the source repo
```

Editing a tracked file directly in `$HOME` does not update the repository. Run
`chezmoi re-add` to pull those changes back into the source state.

See the chezmoi [README](https://github.com/twpayne/chezmoi) for more information.
