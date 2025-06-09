if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

fish_add_path $HOME/.local/bin

if type -q go
    set -x GOPATH $HOME/go
end
if type -q zoxide
    zoxide init fish | source
end
if type -q direnv
    direnv hook fish | source
end
if type -q task
    task --completion fish | source
end

alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias ard="autorandr default"
alias arg="autorandr game"

if not set -q SSH_CONNECTION
    set -x SSH_AUTH_SOCK ~/.1password/agent.sock
end

function fzf_tailscale_nodes
    set node (tailscale status | awk '!/^#/ && $2 != "" {print $2}' | fzf)
    if test -n "$node"
        commandline -i "$node"
    end
end
bind \cs fzf_tailscale_nodes

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
