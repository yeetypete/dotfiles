if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

# Configure 1password SSH agent
if test -z "$SSH_AUTH_SOCK"
    set -x SSH_AUTH_SOCK ~/.1password/agent.sock
end

if test -n "$SSH_CLIENT" || test -n "$SSH_TTY"
    set -x GIT_SSH_COMMAND "ssh -o IdentityAgent=$SSH_AUTH_SOCK"
end

fish_add_path $HOME/.local/bin

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/psiegel/miniconda3/bin/conda
    status is-interactive && eval /home/psiegel/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/psiegel/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/psiegel/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/psiegel/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

